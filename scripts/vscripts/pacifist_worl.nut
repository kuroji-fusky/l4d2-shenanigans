function OnGameEvent_infected_death(params)
{
    local attacker = GetPlayerFromUserID(params.attacker);

    if (attacker != null && !IsPlayerABot(attacker))
    {
        JustDie();
    }
}

function OnGameEvent_player_death(params)
{
    if (!("attacker" in params) || !("userid" in params)) return;

    local attacker = GetPlayerFromUserID(params.attacker);
    local victim = GetPlayerFromUserID(params.userid);

    if (attacker != null && victim != null)
    {
        if (!IsPlayerABot(attacker) && victim)
        {
            JustDie();
        }
    }
}

function JustDie()
{
    ClientPrint(null, 3, "OH YOU DEAD NOW.");
    for (local player = null; player = Entities.FindByClassname(player, "player");)
    {
        if (player.IsSurvivor())
        {
            player.TakeDamage(999, 0, null);
        }
    }
}