Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795089621;
	b=NxZYT4Mu7TJxI4S1TkZL9R++XoXwCJmGzLHY28wQ5/2A/3ssXlPdIacO3Z+g5GDhhCK3
	 OYN5VsJYaToyjUxX/kxtWI0bTqlyLcfOu/UPtgyC/M9TLhVHmL11evimTkQKpmmJz0EiX
	 wh6yLble8LYAOeTT7OSQtfVugNiBaRrIMkxeHBOh+dNW6z3fYoV2or+krITx9634eYqMf
	 xopmRjuyi0xYGIpybaPW6jhCT9cGHvOGkiUOnLDYqvgM6/uo/wl9KebqKY+VYqCpgJkfD
	 XwQ9cpnAbOjo6uGLrz45doqcBnGuxTH/srk0luSxQpNKnlOcR26TC/bYqAIiAEoioaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795089621;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=gHihami8Hw3KiT1c9S+seF0Ysxwc1soMqoPWxdiIsBk=;
	b=kOG0u92cL4rxmRgAzqQG7GYKZvi16mxtiWNHtbWM88D8iA0uek6W0GEDTIpGcVwaLxQY
	 gAzeue703QwPVpoxG/cypb4nVk7+j/4CddlJr28j3VW2fEHkRECdxMD++Kf2rdpHCZnGW
	 ueWj2eg379dcoX+t7SmHZLNdWQDKeXuTs7fSbSfdATPEy+Ykiso5eIR4uHwAXmviVABjQ
	 ZUg70wxruZzH8UsC6bk3YpaiQoUsW97Q/BtqKBnpLdueTwP6ufxaTlgtuMxtGGgFOl4ik
	 ttEP9Gxmw3z07RGR2cRPesdCtQJ0LbU1Z3QEI+r1f90PZgYT/BrnDu9bMPNz/NKwvlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k6NeyC1V;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AEBC60A260B;
	Thu, 19 Nov 2026 12:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k6NeyC1V
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 147D51F000C4;
	Thu, 19 Nov 2026 12:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795089620;
	bh=gHihami8Hw3KiT1c9S+seF0Ysxwc1soMqoPWxdiIsBk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=k6NeyC1V7QTcGlRo9j5JxTMLtcKGPG1jCO+hIPseEjsBPeOZr1+nZD5M4AY/c3QQB
	 cZ1uIr0l185IXgx5yEBBCi59vTGshn2Y1sZ3c/TM3nbuvJsKx2gla104H2G1cz3NGv
	 czUA6y/i6nOSeawwVrk4TR9nAAlStjzVa1MkYt16uE/gywoeX5ricXsclZQphOKCoL
	 /p53QMU74w1gX3h2jFsHyCfTD0mP+vCntroGpm3yvDJTiqrMfHQhm/ihQ1LoC487UC
	 3xXAiaoGUd2WyTYepQ8BO1fY702qt97vZL9SXs+djkcb8gtwkhJ8aJNcIhugHb7219
	 pZgE+TVY8GOIg==
Subject:
 Re: [PATCH net-next v6 3/3] net: phy: acx00: report receive statistics
From: netdev-bot+sashiko@kernel.org
To: james.hilliard1@gmail.com
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
 rdunlap@infradead.org, o.rempel@pengutronix.de, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Date: Thu, 19 Nov 2026 12:00:19 +0000
Message-ID: <179508961966.3136.18071124735934068397@kernel.org>
In-Reply-To: <20261116-submit-acx00-phy-stats-v1-v6-3-8feef8e76cd5@gmail.com>
References: <20261116-submit-acx00-phy-stats-v1-v6-3-8feef8e76cd5@gmail.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 3

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] Only the RX byte counter gets a plausibility check: samples >=
  ACX00_RX_BYTES_WRAP are skipped without moving the baseline.
- [Low] In __acx00_ephy_config_init() (drivers/net/phy/xpowers/acx00.c),
  the new statistics baseline snapshot goes through…
- [Low] In __acx00_ephy_update_stats(), stats_last[ACX00_STAT_RX_PACKETS]
  and stats_start[ACX00_STAT_RX_PACKETS] only advance when…
- [Low] Counter baselines are only invalidated inside
  acx00_ephy_soft_reset() (and power-off/resume), under priv->state_lock.

--

net: phy: acx00: report receive statistics

This commit adds receive statistics to the AC200/AC300 PHY driver. It
reports rx_packets, rx_errors and rx_bytes through get_phy_stats, using
counters that update_stats samples from vendor page 9 and adds into
64-bit totals with wrap handling. Baselines are invalidated across soft
reset, power-off and resume, and deltas are discarded after gaps of 320
seconds or more.

> diff --git a/drivers/net/phy/xpowers/acx00.c b/drivers/net/phy/xpowers/acx00.c
> index cee6c7ff0278e..0015816fad078 100644
> --- a/drivers/net/phy/xpowers/acx00.c
> +++ b/drivers/net/phy/xpowers/acx00.c

[ ... ]

> @@ -110,6 +138,169 @@ static int acx00_ephy_write_page(struct phy_device *phydev, int page)

[ ... ]

> +/* Return a mask of usable counters, or a negative MDIO error. */
> +static int acx00_ephy_read_counts(struct phy_device *phydev, u32 *counts)
> +{

[ ... ]

> +	/* Bracket the packet counter with an unchanged CRC count. */
> +	for (i = 0; i < ACX00_COUNTER_READ_ATTEMPTS; i++) {
> +		ret = acx00_ephy_read_counter(phydev, ACX00_PAGE9_RX_PACKETS_HIGH_REG,
> +					      &packets);
> +		if (ret < 0)
> +			return ret;
> +		if (ret)
> +			break;
> +		ret = acx00_ephy_read_counter(phydev, ACX00_PAGE9_RX_CRC_ERRORS_HIGH_REG,
> +					      &errors);
> +		if (ret < 0)
> +			return ret;
> +		if (ret)
> +			break;
> +		if (errors == counts[ACX00_STAT_RX_CRC_ERRORS]) {
> +			/* Both hardware counters and their difference wrap at 2^32. */
> +			counts[ACX00_STAT_RX_PACKETS] = packets - errors;
> +			return BIT(ACX00_STAT_RX_PACKETS) | BIT(ACX00_STAT_RX_CRC_ERRORS);
> +		}
> +		counts[ACX00_STAT_RX_CRC_ERRORS] = errors;
> +	}
> +
> +	/* Keep reporting errors even when no coherent packet sample is possible. */
> +	return BIT(ACX00_STAT_RX_CRC_ERRORS);

[Severity: Low]
When the CRC count changes during all three bracket attempts, only the CRC
bit is returned. This leaves stats_last[ACX00_STAT_RX_PACKETS] and
stats_start[ACX00_STAT_RX_PACKETS] at their old values.

On a link with a sustained high CRC-error rate, this could happen on every
poll for 320 seconds or more:

_phy_state_machine()->phy_update_stats()->acx00_ephy_update_stats()

When a coherent pair finally arrives, __acx00_ephy_update_stats() checks
the interval against the stale timestamp:

	if ((priv->stats_valid & BIT(i)) &&
	    ktime_ms_delta(ktime_get_boottime(), priv->stats_start[i]) <
	    (s64)ACX00_STATS_MAX_INTERVAL_MS) {
		...
	}
	priv->stats_last[i] = counts[i];
	priv->stats_start[i] = start;

The delta is dropped, but the baseline still moves forward. Wouldn't all
good frames received since the last coherent sample then be permanently
missing from rx_packets?

That seems to conflict with the commit message:

    A later coherent pair accounts for the intervening successful frames.

The 320 second window comes from the 4e9 byte-counter modulus. At about
148,810 frames/s at 100 Mb/s, the 32-bit packets-minus-errors value would
take hours to wrap. Could the frame counters use a longer window?

> +}

[ ... ]

> +	ret = acx00_ephy_read_counter(phydev, ACX00_PAGE9_RX_BYTES_HIGH_REG,
> +				      &counts[ACX00_STAT_RX_BYTES]);
> +	if (ret < 0)
> +		goto out_restore_page;
> +	if (!ret && counts[ACX00_STAT_RX_BYTES] < ACX00_RX_BYTES_WRAP)
> +		valid |= BIT(ACX00_STAT_RX_BYTES);
> +	ret = valid;
> +
> +out_restore_page:
> +	ret = phy_restore_page(phydev, oldpage, ret);
> +	if (ret < 0)
> +		return ret;
> +
> +	for (i = 0; i < ACX00_NUM_STATS; i++) {
> +		u64 count;
> +
> +		if (!(ret & BIT(i)))
> +			continue;
> +		count = counts[i];
> +
> +		/* Include sleep and read time; unseen cycles cannot be recovered. */
> +		if ((priv->stats_valid & BIT(i)) &&
> +		    ktime_ms_delta(ktime_get_boottime(), priv->stats_start[i]) <
> +		    (s64)ACX00_STATS_MAX_INTERVAL_MS) {
> +			if (count < priv->stats_last[i])
> +				count += i == ACX00_STAT_RX_BYTES ?
> +					ACX00_RX_BYTES_WRAP : BIT_ULL(32);
> +			priv->stats[i] += count - priv->stats_last[i];

[Severity: Medium]
Can a single non-monotonic frame or CRC sample permanently add about 2^32
to rx_packets or rx_errors?

Only the byte counter has a plausibility check: samples at or above
ACX00_RX_BYTES_WRAP are skipped. For the CRC counter and the derived
packets-minus-errors value, any sample below stats_last[] counts as a
full 2^32 wrap, and the resulting delta has no upper bound.

An all-ones read is one way this can happen. Suppose the PHY stops
responding on an MDIO controller that returns 0xffff without an error.
acx00_ephy_read_counter() then sees high == check == 0xffff and returns
0xffffffff as a valid sample.

The CRC count reads 0xffffffff on both bracket reads, so packets - errors
is 0 and rx_packets gains 2^32 - N. The next good sample wraps again, and
both totals stay around 2^32 too high.

The other way is if the hardware updates the packet and CRC counters at
different times for the same bad frame. The bracket in
acx00_ephy_read_counts() could then see the frame in packets but not yet
in errors, or the reverse:

	if (errors == counts[ACX00_STAT_RX_CRC_ERRORS]) {
		/* Both hardware counters and their difference wrap at 2^32. */
		counts[ACX00_STAT_RX_PACKETS] = packets - errors;

On the next sample, the -1 would become a jump of 2^32 - 1. Is it known
that the two counters update together?

The commit message bounds the rate at "one frame per received byte". Under
that bound, any real frame delta within the 320 second window is below
4e9. Could frame and CRC deltas in [4e9, 2^32) be rejected, the same way
out-of-range byte samples are?

> +		}
> +		priv->stats_last[i] = counts[i];
> +		priv->stats_start[i] = start;
> +		priv->stats_valid |= BIT(i);
> +	}

[ ... ]

> @@ -350,6 +545,10 @@ static int acx00_ephy_soft_reset(struct phy_device *phydev)
>  
>  	mutex_lock(&priv->state_lock);
>  
> +	/* phylib may already have reset the counters before calling us. */
> +	priv->stats_active = false;
> +	priv->stats_valid = 0;
> +

[Severity: Low]
Does this invalidation happen early enough when phy_mii_ioctl() triggers
the reset?

For SIOCSMIIREG on MII_BMCR with BMCR_RESET, drivers/net/phy/phy.c does:

phy_mii_ioctl()
	mdiobus_write(phydev->mdio.bus, prtad, devad, val);

	if (prtad == phydev->mdio.addr &&
	    devad == MII_BMCR &&
	    val & BMCR_RESET)
		return phy_init_hw(phydev);

Neither call holds phydev->lock. _phy_state_machine() can therefore run
phy_update_stats()->acx00_ephy_update_stats() after the raw reset write
but before acx00_ephy_soft_reset() takes state_lock. stats_active and
stats_valid are still set at that point.

This comment assumes the reset clears the page 9 counters. If it does,
the new values are lower than stats_last[], and __acx00_ephy_update_stats()
treats them as a wrap:

	if (count < priv->stats_last[i])
		count += i == ACX00_STAT_RX_BYTES ?
			ACX00_RX_BYTES_WRAP : BIT_ULL(32);

The totals are kept across resets. Would rx_packets, rx_errors and
rx_bytes then stay inflated by about 2^32 or 4e9?

The window is narrow and needs CAP_NET_ADMIN.

[ ... ]

> @@ -475,10 +674,21 @@ static int __acx00_ephy_config_init(struct phy_device *phydev)

[ ... ]

> +	if (!priv->stats_active) {
> +		/* Establish a new baseline after reset, retaining the software total. */
> +		priv->stats_active = true;
> +		acx00_ephy_snapshot_stats(phydev);
> +	}
>  
> -	return genphy_restart_aneg(phydev);
> +	return 0;
>  }

[Severity: Low]
Should MDIO and page-restore errors from this snapshot be propagated?

acx00_ephy_snapshot_stats() drops every negative return from
__acx00_ephy_update_stats():

	ret = __acx00_ephy_update_stats(phydev);
	if (ret)
		phydev_dbg(phydev, "failed to snapshot statistics: %pe\n", ERR_PTR(ret));

That includes a phy_restore_page() failure after
phy_select_page(phydev, ACX00_PAGE_9).

__acx00_ephy_config_init() then returns 0, so acx00_ephy_config_init()
skips its power-off path. phy_init_hw() and resume report success while
the page register may still be on page 9. Later phy_select_page() calls
would then save page 9 as oldpage and restore back to it.

Every other paged access in config_init propagates the phy_restore_page()
result. The commit message also says:

    Real MDIO errors, including page-restoration failures, still propagate.

That holds for the .update_stats callback, but not for this snapshot.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116-submit-acx00-phy-stats-v1-v6-0-8feef8e76cd5%40gmail.com
