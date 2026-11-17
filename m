Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794941427;
	b=Kkl7NSfBndk3CawvV2PZGQuJqLJqbdQHvUURdZQ5Yo0HER24fFkwpBF+r7rV5BWPLKel
	 weHqHXMuY+Ed85FBztyzFPoBEAqv7OAZ/nmzcEdHTZw6BHpv3vvB2cJEHoNFx99Oo60a5
	 rDxlvviXFKaEmGYlHtf+egTiLZwAt8xCM4KATMImuQQqqYDaHbsRrvA8/0OIG5ifcCv1K
	 LoSAboE1l2to/hxrHtSCaxENmZ9V7qC1xUCzj7l/y5unq8Souz80AQNb3hBEjEX5fOuaV
	 no4W+RXOB3AKhtgejlGwFznKlLwxPa5WMtw3r/uIeOSIgjF5bI/HpVRb5HBupbuSU+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794941427;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=ASGl5+9UfMcAHtxJsuDrc0AyGWrXaLdzmZsgdHF+Olg=;
	b=zJzikdJ/VR9uClkehy7S313zuY3wwN2vAl7D4IFuOPlXbGv9bUVhwCq8jQ2sdE3Io/Qv
	 r2QLy5hw8DFhX/h778731StGrVe8Lzbt1LVqyrKiuCqtDYWuUfLEwh+VnzQFA4g0DqEIT
	 QBhvxTSi7J14EcDeiJRjAihQ/sZFstP0fmrQv9UuImkr7tEby/1HgR2dbWFUliX5tG+Q6
	 QEypLWFixMIAhzWhBWCNXCk5jnonFgb81rF5xR8Hbe1zSkvUXa/YF+2dmyO25fXg5oK+r
	 ckLrkAhvSdpmOTO65R7cR0zt+YwhSjA++02n4mAyT/cwNf+7Fc5WKVympEM/Y6AXu5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Oj8lyOJR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6150F606A88C;
	Tue, 17 Nov 2026 18:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Oj8lyOJR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 678831F000C7;
	Tue, 17 Nov 2026 18:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794941427;
	bh=ASGl5+9UfMcAHtxJsuDrc0AyGWrXaLdzmZsgdHF+Olg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Oj8lyOJRy12FzTHJuF3ItrUi22LOeODYcjjvYaVf0R5VspvkUkQ9DlgMSUmyAwHCt
	 U/Wa5SKtphcFcdE28EjtXvWjXEOnsLyQu9Njs/LdXhFHeNMNAJnatVGmptpBja6Z+h
	 dOaG9+r2UXQ1sHG3WCPPF7ogrcTgLPAGsWug0+6FGFSCI5Vc9v2rEKHI8fNf+GU6Wh
	 sdcgeApDgT3OVYqgtPpvblmidMLpt2jVluox/yvcoaUztNZ2WMktTrRpEQVAodtZnG
	 pnhJBiy+R5ixSCRGLpi4SzT6ZyTlh/GnjsttI1znlUHtu7CqiuqV7NJl0BMrvJTEhZ
	 l53yhArI/32Jg==
Subject:
 Re: [PATCH net-next v4 2/3] net: phy: acx00: report receive statistics
From: netdev-bot+sashiko@kernel.org
To: james.hilliard1@gmail.com
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
 rdunlap@infradead.org, o.rempel@pengutronix.de, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 stable+noautosel@kernel.org
Date: Tue, 17 Nov 2026 18:50:25 +0000
Message-ID: <179494142597.3136.3833380345536721828@kernel.org>
In-Reply-To: <20261113-submit-acx00-phy-stats-v1-v4-2-986b8a4a1871@gmail.com>
References: <20261113-submit-acx00-phy-stats-v1-v4-2-986b8a4a1871@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The receive-statistics baseline is invalidated only inside
  acx00_ephy_soft_reset() (drivers/net/phy/xpowers/acx00.c), once that…
- [Medium] In __acx00_ephy_update_stats()
  (drivers/net/phy/xpowers/acx00.c), the wrap adjustment hard-codes a…

--

net: phy: acx00: report receive statistics

This commit reports the ACx00 PHY receive packet, byte and CRC-error
counters through the generic PHY statistics interface. The free-running
hardware counters are polled through the update_stats callback and added
into 64-bit totals with wrap adjustment. The baseline is invalidated on
soft reset, power-off, resume, and after long polling gaps.

> diff --git a/drivers/net/phy/xpowers/acx00.c b/drivers/net/phy/xpowers/acx00.c
> index cee6c7ff0278e..fb53bac12195c 100644
> --- a/drivers/net/phy/xpowers/acx00.c
> +++ b/drivers/net/phy/xpowers/acx00.c

[ ... ]

> @@ -110,6 +144,124 @@ static int acx00_ephy_write_page(struct phy_device *phydev, int page)

[ ... ]

> +static int __acx00_ephy_update_stats(struct phy_device *phydev)
> +{

[ ... ]

> +	/* Skip unusable samples without turning a statistics miss into a link error. */
> +	if (ret || counts[ACX00_STAT_RX_BYTES] >= ACX00_RX_BYTES_WRAP)
> +		return 0;
> +
> +	/* Include sleep and read time; complete unseen cycles cannot be recovered. */
> +	if (priv->stats_valid &&
> +	    ktime_ms_delta(ktime_get_boottime(), priv->stats_start) >=
> +	    (s64)ACX00_STATS_MAX_INTERVAL_MS)
> +		priv->stats_valid = false;
> +
> +	for (i = 0; i < ACX00_NUM_STATS; i++) {
> +		u64 count = counts[i];
> +
> +		if (priv->stats_valid) {
> +			if (count < priv->stats_last[i])
> +				count += i == ACX00_STAT_RX_BYTES ?
> +					ACX00_RX_BYTES_WRAP : BIT_ULL(32);

[Severity: Medium]

Has the 2^32 rollover been measured for the packet (0x1b/0x1c) and
CRC-error (0x1d/0x1e) counters? The commit message gives hardware
measurements for the byte counter's 4,000,000,000 modulus. For the other
two counters it only says:

  "The packet and CRC-error counters wrap at 2^32."

All three counters sit next to each other in page 9 and are read the same
way. If the packet or CRC counters wrap at 4e9 like the byte counter, each
wrap adds BIT_ULL(32) instead of 4e9. That would add an extra 294,967,296
to rx_packets_total or rx_errors on every wrap.

Only the byte sample is checked against its modulus above. The packet and
CRC samples are never range-checked, so nothing here would catch a wrong
modulus.

> +			priv->stats[i] += count - priv->stats_last[i];
> +		}
> +		priv->stats_last[i] = counts[i];
> +	}
> +	priv->stats_valid = true;
> +	priv->stats_start = start;

[ ... ]

> @@ -350,6 +506,10 @@ static int acx00_ephy_soft_reset(struct phy_device *phydev)
>  
>  	mutex_lock(&priv->state_lock);
>  
> +	/* phylib may already have reset the counters before calling us. */
> +	priv->stats_active = false;
> +	priv->stats_valid = false;
> +

[Severity: Medium]

Can a concurrent poll count a BMCR reset as a counter wrap before this
invalidation runs?

phy_mii_ioctl() in drivers/net/phy/phy.c writes BMCR_RESET before it
reaches the driver's soft_reset:

	mdiobus_write(phydev->mdio.bus, prtad, devad, val);

	if (prtad == phydev->mdio.addr &&
	    devad == MII_BMCR &&
	    val & BMCR_RESET)
		return phy_init_hw(phydev);

This path runs under RTNL only. It holds neither phydev->lock nor
state_lock, and it does not stop the state machine.

Meanwhile, _phy_state_machine() in PHY_NOLINK or PHY_RUNNING calls
phy_update_stats()->acx00_ephy_update_stats().

Suppose that poll takes state_lock after the BMCR_RESET write but before
acx00_ephy_soft_reset() takes it. Then stats_active and stats_valid are
still true. __acx00_ephy_update_stats() reads the cleared page-9 counters
and sees count < stats_last[i]. It then adds ACX00_RX_BYTES_WRAP or
BIT_ULL(32) and commits the result to priv->stats[].

Clearing stats_valid here afterwards does not remove that delta.
rx_bytes_total would grow by about 4e9 minus the old byte baseline.
rx_packets_total and rx_errors would each grow by about 2^32 minus their
baselines.

The commit message says the invalidation covers the case where "phylib may
already have reset the PHY through BMCR or its reset signal". Does that
hold if a poll runs between the reset write and soft_reset?

This needs CAP_NET_ADMIN and a narrow timing window. Still, nothing in the
driver orders the reset write against the collector.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261113-submit-acx00-phy-stats-v1-v4-0-986b8a4a1871%40gmail.com
