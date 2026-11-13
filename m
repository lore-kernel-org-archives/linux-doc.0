Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794609801;
	b=g1eTx4MhUsLydH+aU7A3dzPW5DZWfebl6y1Hm3ng3L9sPu9O0vPJiylc2RAvdLJX8o5W
	 slTg6fQPhW2zgeU6xYKd3gl6BGCUX4KFgBmmKBNNGyVYJaygW/qtH0rXh2k/zfcRy9QLN
	 BWSmXjH0/2m9vJ+spLEoXq1jzUWlbxL4C7uWW6Tt5EHIHjdOYdB5Eaf8BIsJBEoxS0yn9
	 AuGTj9coWEv97Eq6swgMYtrSngRY/x3VqcAOZho74fkueoNzMHzQgqXg2KzK4BGmPsrIw
	 a6Wpx8Yyvw3CJI+rs2PxrKpGhOgTW+dkXh1LTs2eGsMjsZbmJzwiezchYoY1e8VABrA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794609801;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Dxs3zEoSbcXfyuXkzQruDQFVj4t8rdiDEgXMtvqtLxY=;
	b=HxHG1MxzrWxf+GxuV1aEAOr+dpW7oCLkQF5iy5RpRFIlKFcko1g84hzNUjRiICPg6KCy
	 ZYaAjAD39AVD0bKn+Mvg16A3jlTHxcz9hI3UIwmTAzPnMJXHPs+w6nR0n04an+arKwtYR
	 vQRG6vQFE4G92EbhVOAosLHHodh3nREsKjWbpNFiac5anThnLFji92yOWnvB5+rysdRLS
	 JjcSc/sZUgliiiDhq9sHJ9XriIWrGDM/EhPsWgSPKLl4T98ZVOxFLT4Bg9VH8sbcEuXnR
	 yw6yCsqtAviecxBn90x081JQ+WwHYqTaEB6HplorwijMle+v1Ge20+HVy21PV5iTfYw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lXNS6fzM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.44
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A6D606A548
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 22:43:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82A6D606A548
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lXNS6fzM
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-980c4f5c921so385243241.2
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 14:43:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794609799; cv=none;
        d=google.com; s=arc-20260327;
        b=mdSfQgGF+pe+9QG13LGcYVKPZdukLCNN1TMGIVyLAPVZcJx95bjgK8J6yGLqLsXrsj
         98lNu2mz760pvfGtCdvFmqxKd41tweztBPPgmiXacLfzpqLsMBdqIL/YGIniytSJEOA1
         pTmRjy40h1OoLH8XggDGYRPQ4Z/XYc91dnK16mkI8WPCvqdmT3ZQbqFr8PHvQwZQp3Gz
         IiHQYlxUszq8P7iPG+pK1cKRXNzKK2XQR6nD2ROzOInmT8PRnL41yG0JBQmByKNvszfS
         ZWs1SM6jRp9T6JBDh57bhZcsyHorwKwXIJfajbTWjmYJFIH9UIAqTTuXgYwG77BTJvgY
         9idQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Dxs3zEoSbcXfyuXkzQruDQFVj4t8rdiDEgXMtvqtLxY=;
        fh=mT7HIKZBDQyPi2Qrc9qS9ZFwcD8nB8wP40iAW8+FChY=;
        b=VSA1ueibZYeRSIufdE9hoWjr8ZxRMmIC1xCvQSwGiWNt58GSmKw8AuMMP06p/sFPqm
         c586AJMFMjT9KwfIXk0N+Fk1v7OcySSZN3kx3iD99WX/TdB11DRMGYgkqI9afTzF4Kjr
         AVNVGo+m4PudYefnFlLzWsPvnpoEHITeokA0X3Y9FmCs88LHxt+Gncj9FLXkZa/UoUDV
         h3hiUtRFQ7zoOHut/9gn3XsVoXajW0FZrPuuTAmn4C5kN5yxsTD4KCEKkMASY7ogrLJ+
         BvIFr0C0dbsYzrrtSGN1DCwtBXa36O7T9CgVg8X9ul5D2E5GR6mmZL4birLo8XEtL6bu
         5WlA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794609799; x=1795214599; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dxs3zEoSbcXfyuXkzQruDQFVj4t8rdiDEgXMtvqtLxY=;
        b=lXNS6fzML+4ms8KRhgrDko+jDoeFLKoP7/8V9vvA0kngy5RONQDDaSWlykfzxvWBqy
         ba3/RQkLsh5FJA7UziUKYswTcUoLp64Sprh1UKYouGqpRI4Zo52eTG9fTjA419TGXujq
         ioxmWNLa+9j3Thyf7jRbQTEXHmqlt/zskzknrOjWG26iWAH1Jm868zz2hs9QpgTc4UMh
         7aTNKsMd9Fd+lzUjNUj0iqIKUs2rHsbmTDUJJOhbyOKm8W+bzoO03dOKoulBUbuBt+Wm
         PbaO0hG5DWySwdQCyKK6qRZ1lJwXcgfoAIi/koTLJVlNNaqY5YaC9c/u23zPaw4bZOv7
         18Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794609799; x=1795214599;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dxs3zEoSbcXfyuXkzQruDQFVj4t8rdiDEgXMtvqtLxY=;
        b=TYUaryPCZAKmybfxOt29IEZ3H382v3tgj6iUknJ1DoKU51lKHC7hRO7Z+aSIR0F5to
         1OybjCM36MxaJIN120BI3v1iw79rt1hZ2rc+11MCNzA0CwQpLCoQp6ECmDiro/iMF4aW
         j5cuOup8btMFj/LHHRwi2qK7is9Fq2evYQbXo2Hno3YMYFEA6DPQWcmp5ynD1rgX4HbG
         YqtJCewg70SidgwUmqtcrHlFYPM5GqUcjF9wUre+E4CuJ+7j0BeADJn2zJjWWuJk1w02
         b7XKACOhabRBqlHCLjaGU58yuacxuLxmkPt2x/TuHxAtJp4DyBCU4dZ1zXnmclG9FBba
         wEjA==
X-Forwarded-Encrypted: i=1; AL+hErEgtOuqIR4Dl3vIjv0XN5aeiJqMESHHId02OEXyll3e7Dg3WB8yH5Jd9AgdrbAlCgPYtVs000dKP9k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8eQIh6F8MtPdtbH5VmgpBjKENcNUnlbW4j9Yl3JpGYkt9YVymY
	twNisQKOCU/Ai6THpw1JJh+9nqAxDBQMtYbDU7H2pOf9AKoCjvtZn0/Mi4CCZACJz2j3LnmJGEj
	TgxjILGKHQn9aEKH8/SK00hcyisH5rJk=
X-Gm-Gg: AYBFou0Fe+G3SSr/+PbNMgyXNBREFPYMSyuhh6GPNWLN8L3HfWl2Dxs3IZ9bvhLZGcb
	bwAIh9HDeoCAa7fNXoTjj8qM92Ernp9lMCo7CfAbZbedP+Pe7Kvq8gFMHcfOR4/76PkfO21H4j6
	LRc3xCGWPm/NC3dRupPhKyMqn6u8bcX76WUEOkQLOjN/94t/hgqSaNGbMpkr6NX4AiOIJ8c6gJT
	FAc1VrkAE9JEKA4KAmjUc+xlIgfgi/4HaQGIdqtm5NedSuBFyB2CGPjlKFEgn0OTrjw1cvzKQxH
	Ae6W64j+AYxPeHIG5ex4vJ9RcIalffQypLU5SF1GqDeUnX0OskIsp+DItRqJKqlrCJGrU0IlTru
	CJTlcWcRw38uUopjN88iXMipHjG2E4hAw78c7lCCi0mOHiYyPqd5tFTv6RUhnfBT14IksQ4xiB7
	aycrF9gElvwIgBjxRE6Uaq/gE9+1LzKMMoLKXw/boyHXdYGJWsX0cqrs4c9O8q+NhCb4B/eYOGS
	1Xpyk+3F9HotTk2MLt8KpaRBYtd1g==
X-Received: by 2002:a05:6102:84c2:b0:7cc:ccb:ce5a with SMTP id
 ada2fe7eead31-7d64d89cdabmr1053049137.28.1794609799139; Fri, 13 Nov 2026
 14:43:19 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109-submit-acx00-phy-stats-v1-v3-0-fbc6327c5be4@gmail.com>
 <20261109-submit-acx00-phy-stats-v1-v3-1-fbc6327c5be4@gmail.com>
 <348f19e7-120e-4b41-adab-be016c7a6083@lunn.ch> <avdaBgWc5tpMhtqF@pengutronix.de>
In-Reply-To: <avdaBgWc5tpMhtqF@pengutronix.de>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 15:43:08 -0700
X-Gm-Features: AclHuK_y5r8zy20zeheg5z5NyDwRpxzoSdoNuCWdWvLU_7paTeMna_98mFT74a0
Message-ID: <CADvTj4q+QuSOre_Z7Kq286fLqrLfTq26oBCarDzx=wrc7Zz_WQ@mail.gmail.com>
Subject: Re: [PATCH net-next v3 1/3] ethtool: add PHY receive frame and byte totals
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 11:42=E2=80=AFAM Oleksij Rempel <o.rempel@pengutron=
ix.de> wrote:
>
> On Tue, Nov 10, 2026 at 05:42:33PM +0100, Andrew Lunn wrote:
> > On Mon, Nov 09, 2026 at 07:48:32PM -0700, James Hilliard wrote:
> > > The generic PHY receive packet and byte counters describe successfull=
y
> > > received traffic. Some PHYs instead count all received frames and byt=
es,
> > > including frames with errors. A frame error count cannot recover the
> > > number of successfully received bytes because damaged frames have
> > > different lengths.
> > >
> > > Add optional receive-total counters to ethtool_phy_stats and the phyd=
ev
> > > statistics group. Count frame bytes including the Ethernet header, pa=
dding
> > > and FCS, and excluding the preamble and start frame delimiter. These
> > > counters describe reception at the PHY, before MAC or host filtering.
> > >
> > > Append the new attributes so existing statistic IDs and their meaning=
s
> > > remain unchanged. Publish the names through the existing statistics s=
tring
> > > set, and retain the unset-counter convention so drivers can report ei=
ther
> > > set of counters independently.
> > >
> > > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > > ---
> > >  Documentation/networking/ethtool-netlink.rst | 16 +++++++++++++++-
> > >  include/linux/ethtool.h                      |  6 ++++++
> > >  include/uapi/linux/ethtool_netlink.h         |  2 ++
> > >  net/ethtool/stats.c                          |  8 +++++++-
> > >  4 files changed, 30 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/Documentation/networking/ethtool-netlink.rst b/Documenta=
tion/networking/ethtool-netlink.rst
> > > index eba226c79ec3..5528d0f7afdd 100644
> > > --- a/Documentation/networking/ethtool-netlink.rst
> > > +++ b/Documentation/networking/ethtool-netlink.rst
> > > @@ -1665,7 +1665,7 @@ the ``ETHTOOL_A_STATS_GROUPS`` bitset. Currentl=
y defined values are:
> > >   ETHTOOL_STATS_ETH_PHY  eth-phy  Basic IEEE 802.3 PHY statistics (30=
.3.2.1.*)
> > >   ETHTOOL_STATS_ETH_CTRL eth-ctrl Basic IEEE 802.3 MAC Ctrl statistic=
s (30.3.3.*)
> > >   ETHTOOL_STATS_RMON     rmon     RMON (RFC 2819) statistics
> > > - ETHTOOL_STATS_PHY      phy      Additional PHY statistics, not defi=
ned by IEEE
> > > + ETHTOOL_STATS_PHY      phydev   Additional PHY statistics, not defi=
ned by IEEE
> > >   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =
=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> > >
> > >  Each group should have a corresponding ``ETHTOOL_A_STATS_GRP`` in th=
e reply.
> > > @@ -1683,6 +1683,20 @@ by ``ETHTOOL_A_STATS_GRP_SS_ID``. Complex stat=
istics (such as RMON histogram
> > >  entries) are also listed inside ``ETHTOOL_A_STATS_GRP`` and do not h=
ave
> > >  a string defined in the string set.
> > >
> > > +The ``phydev`` group provides separate counters for successfully rec=
eived
> > > +traffic and total received traffic.
> >
> > You need to be careful with naming here. This is a
> > kAPI. phydev/phylib/phylink are implementation details, a set of
> > helpers which some MAC drivers use to implement PHYs. But MAC driver
> > can implement PHYs in different ways, and don't need to use a phydev.
> >
> > ``ETHTOOL_A_STATS_PHY_RX_PKTS``
> > > +(``RxFrames``) and ``ETHTOOL_A_STATS_PHY_RX_BYTES`` (``RxOctets``) c=
ount
> > > +successfully received frames and bytes. ``ETHTOOL_A_STATS_PHY_RX_PKT=
S_TOTAL``
> > > +(``RxFramesTotal``) and ``ETHTOOL_A_STATS_PHY_RX_BYTES_TOTAL`` (``Rx=
OctetsTotal``)
> > > +include frames with errors. The total byte count includes the Ethern=
et header,
> > > +padding and FCS, but excludes the preamble and start frame delimiter=
.
> >
> > And what would you call it when the counter does include the preamble
> > and start frame delimiter?
> >
> > Take a step back. Just because this PHY has these counters, do we need
> > to support them? And what happens when the next PHY comes along with
> > slightly different counters? Do we add them as well?
> >
> > It is vendor SDK syndrome. The hardware can do this, so lets expose
> > it.
> >
> > What is your use case here which justifies these specific counters.
>
> I have the same question. James, your answer mentions traffic monitoring
> and error diagnosis, but not a concrete problem on AC200/AC300 that these
> totals would help with. My guess is a receive problem that another driver
> for this PHY already works around.
>
> Rockchip's vendor driver for the same PHY ID (RK630 and RV1106) reads the
> packet and CRC error counters from page 9, registers 0x1b/0x1c and
> 0x1d/0x1e:
>
> https://github.com/rockchip-linux/kernel/blob/eeb355823a794954737fd75820d=
fccdab4c57af6/drivers/net/phy/rk630phy.c#L430
>
> The vendor driver does not export them. It polls them to tune the
> receiver. If there is a signal but no link, it switches to a second
> analog setting and checks again. It switches settings in two more cases:
> too few frames arrive, or more than 15% of the frames have a CRC error.

Allwinner applies efuse-derived trim on both AC200 and AC300 alongside
hard-coded PHY register settings. AC200 uses one fixed set of settings;
AC300 selects between two sets using efuse bit 9. These are applied at
initialization, rather than adjusted from live packet/error statistics.

> Its comments call this "Long network cable parameters". It also changes
> the RX detect threshold depending on the temperature.
>
> Do you see a problem like this on your AC200/AC300 boards? If so, can
> you describe it? Then we can decide whether the driver should work
> around that problem.

I haven't reproduced that problem or tested long cables and temperature
extremes. Temporary register changes on AC200 confirmed that candidate
tuning fields are writable, but not that their analog meanings match
Rockchip's. Adaptive tuning could be relevant future work, but I don't
yet have evidence that ACx00 needs the Rockchip workaround.

>
> Oleksij
