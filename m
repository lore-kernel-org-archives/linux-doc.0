Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795089620;
	b=kGkDNCAPuagivZysv6ySSllTAMUSnCP+3mY61PNZF4IuyqnU72yxgkzj7emzdIlX8bRd
	 VWcI8g7s8zfLSG7gWiIZaBKHT9p/nfL8QPJmY6x1a6vcsiavpT0vM8yCtQIamzyveU9RU
	 rcxSVoA6AnJpGWd0gzql8iMpK1d+Z3VSREv8N3ApsiAQiHzMO0EpLvQCtK3EUwL+Mo+Lm
	 +pqW6jHmO0QMY4SCC+pPGsWmeKFViu0ArWBkCk3ZmSR0eW2l4grEqnBydOP1AZOL4doTY
	 lyLaw76f4TG8Adp8c/TnxshlAyCe21Jd+NWNYReO/Z2aJayZB75gmY/Xef5mmevSXEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795089620;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=uNHLapStU2qi51kAgssvchPzLBaG6WLEuOPeOcyPnW0=;
	b=IC/OJFqdNOAHwAN0kCscB9EMvRJZkcWwnGCw0fvmBoOC62DTzXKnCacJZq/nD84s44h6
	 ZgwZEYfKhw2EPDC2iktcTFvM88rbPECaqRjj7KgatdT0/KaTneSYjIvh0GnJn48oZG5E0
	 VTcj2uilRJtuuQD5XmRelZ6Nte3krS50Y3KqwNLMRExzX9Bi/C/i6K2NPqFVpLo5ovN3u
	 gu8aMls+y27ElT7SZ42e7k0g3ZrvbiMXINNdXb1p06KnHH69J7a/cKws3UXf8BuHQpT3k
	 VN1se1Ve7qx+iV+6YGufRYS98AJp0BHSZjupY0IwTNe4mYrRwHJIDM03rJkPSWAljfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d+ZNtXY7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CE2606A33E;
	Thu, 19 Nov 2026 12:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d+ZNtXY7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEC981F000C4;
	Thu, 19 Nov 2026 12:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795089619;
	bh=uNHLapStU2qi51kAgssvchPzLBaG6WLEuOPeOcyPnW0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=d+ZNtXY7iBQ4FqSRzyYP/Bb/iox2XJjQpqmLU0q6kMgQDLPNfQ9gJfms9NCMIhbkt
	 +HbyHigwJiGxCD9RnpA/3+9oqE4mjZHJi2kzS9U3aavXyDh3rvI2FGcKmv2Z87MQHz
	 kh/H03dqlaSMzewjXpdif0B3IBddG4dZw86K0bBGbKC3cgfChSO7JxxoQZpTLXQd2h
	 1Ob7HdqH+GI4tGxuDTxexj3HFzQvFlQJY7vJ0swHE6alvSGA8Ki3Y+XrF5OVAYplb+
	 c7U1AMsTV1S+78E7rLSzvdRvuZnrMB/riY+rbbarSmO3Mt0fY1yiYyOuNXHNzuzvw8
	 duFqcUza0ztGw==
Subject: Re: [PATCH net-next v6 2/3] ethtool: include errored frames in PHY
 receive byte counts
From: netdev-bot+sashiko@kernel.org
To: james.hilliard1@gmail.com
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
 rdunlap@infradead.org, o.rempel@pengutronix.de, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Date: Thu, 19 Nov 2026 12:00:18 +0000
Message-ID: <179508961824.3136.4655138931772662232@kernel.org>
In-Reply-To: <20261116-submit-acx00-phy-stats-v1-v6-2-8feef8e76cd5@gmail.com>
References: <20261116-submit-acx00-phy-stats-v1-v6-2-8feef8e76cd5@gmail.com>
X-sashiko-severity: Low
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The commit message says the patch defines rx_bytes in two ways:
  it includes bytes in frames with errors, and it counts reception at…
- [Low] After this patch, the counters in the ETHTOOL_STATS_PHY
  ("phydev") group no longer count the same set of frames, and nothing…

--

ethtool: include errored frames in PHY receive byte counts

This commit changes the kerneldoc for rx_bytes in struct ethtool_phy_stats
from "Total successfully received bytes" to "Total received bytes". The
commit message says the goal is to let PHY drivers report a hardware byte
count that includes frames with errors.

> diff --git a/include/linux/ethtool.h b/include/linux/ethtool.h
> index c3a41fbd5426d..9c3f079d9573e 100644
> --- a/include/linux/ethtool.h
> +++ b/include/linux/ethtool.h
> @@ -481,7 +481,7 @@ struct ethtool_eth_phy_stats {
>  /**
>   * struct ethtool_phy_stats - PHY-level statistics counters
>   * @rx_packets: Total successfully received frames
> - * @rx_bytes: Total successfully received bytes
> + * @rx_bytes: Total received bytes

[Severity: Low]
The commit message says:

    Define this existing counter to include bytes in frames with errors so
    drivers can report their hardware byte count through it. The counter
    describes reception at the PHY, independently of MAC or host filtering.

Does the new kerneldoc line say either of these things? "Total received
bytes" does not say that errored frames are included. It also says nothing
about counting before MAC or host filtering.

Nothing else in the tree documents the new meaning either. The uAPI comment
covering ETHTOOL_A_STATS_PHY_RX_BYTES in include/uapi/linux/ethtool_netlink.h
only says:

	/* Basic packet counters if PHY has separate counters from the MAC */

The group table in ethtool-netlink.rst only says "Additional PHY
statistics, not defined by IEEE".

Neither of these changes by the end of the series (after "net: phy: acx00:
report receive statistics"). The definition therefore exists only in this
commit message.

Could the line state it directly, for example "Total bytes in all frames
received by the PHY, including frames with errors"?

>   * @rx_errors: Total received frames with errors (e.g., CRC errors)
>   * @tx_packets: Total successfully transmitted frames
>   * @tx_bytes: Total successfully transmitted bytes

[Severity: Low]
After this change, @rx_packets and @tx_bytes still say "successfully", but
@rx_bytes is meant to include errored frames. Should the doc say that the
two RX counters now cover different sets of frames?

stats_put_phydev_stats() in net/ethtool/stats.c sends them to userspace
together as the RxFrames/RxOctets pair:

	if (stat_put(skb, ETHTOOL_A_STATS_PHY_RX_PKTS,
		     data->phydev_stats.rx_packets) ||
	    stat_put(skb, ETHTOOL_A_STATS_PHY_RX_BYTES,
		     data->phydev_stats.rx_bytes) ||

The first user is acx00_ephy_get_phy_stats(), added later in this series
by "net: phy: acx00: report receive statistics". It relies on this split.
It reports rx_packets without CRC-errored frames, and rx_bytes as the raw
hardware total that includes them:

	stats->rx_packets = priv->stats[ACX00_STAT_RX_PACKETS];
	stats->rx_errors = priv->stats[ACX00_STAT_RX_CRC_ERRORS];
	stats->rx_bytes = priv->stats[ACX00_STAT_RX_BYTES];

Userspace that computes RxOctets / RxFrames (average frame size) would get
inflated numbers. So would userspace that compares the RX pair with the TX
pair. Nothing in the uAPI header, ethtool-netlink.rst or the kerneldoc
explains the difference.

The commit message explains why rx_bytes has to include errored frames. It
does not say why the difference between the two RX counters is left
undocumented.

Could the doc say something like "including frames with errors (unlike
@rx_packets)"? Alternatively, the pair could stay consistent, with a
separate attribute added for bytes in all frames.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116-submit-acx00-phy-stats-v1-v6-0-8feef8e76cd5%40gmail.com
