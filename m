Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D92364046
	for <linux-doc@vger.kernel.org>; Mon, 12 Jan 2026 17:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768239848; cv=none; b=bRePWOr9k5Lb8AsShynkYz2C2JNV4VAzx4FkQbE6m0TMcgyIdP4XsXJCTCqf4JbELISYcpimXMiRYVk74XQhqKmJJkOcpSOTM/nKTev622WsLOWhC9n8D+6hnIYsQYY+NDUuOf15nA4mMOHK2U2xrKBnCDie79aR2X39it/xcU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768239848; c=relaxed/simple;
	bh=ckuWa0hcl9zBmOGgxyGXZh35WwzxE05Qj5kMhP0yefE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q8aKWEd5DpZ6jBbam3eaD6Ks6PM37I7OZROvhuMQauL6AIIZTVIc+gJVex4eJ5zATabYo75Rv8+0NfSoHUrSrBUBC7mdhAQCM/Gwp362NYuxnEWzKf6gbID56F8En4yYfMQmNhKkyNFMejJPmF/zXVK4k67MgBUI/EoVTSFQz6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cV259BDL; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cV259BDL"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c026e074373so3157702a12.1
        for <linux-doc@vger.kernel.org>; Mon, 12 Jan 2026 09:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768239846; x=1768844646; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R2PM847sZezm8qMDrlA/C+aIUOustWEHzoWUNlVlTog=;
        b=cV259BDLgViihtUr2aR3BuHi6K4wmrQYwTB9kVf0dCgpR6/T2/ERG5dtfBIPPYoOBV
         xEpChRBk7rhwcUq4nmQswDnxY5Dn7FZ0uDsduTvYZDkRQsMLdNK9LKDu8mhioNwQnto/
         05fqH3dgMy9Bh66c1jZnO8TeznUI3yjhQTwygi9M5IacgHi/HZhBC0ED/cboA7dr0aQF
         KthJvg1oygumppuOSzo+fa68mNqsxBNHDViEiQHS2z0Ov583/LGjLbH4N6T8yTlFb5rP
         JQzPoNlPVoH1ExFTxyS3ul3tSYsWgYSV9YU2Ga6jP5R0UStserkWkXQWrYP/Q0Cwr1ei
         FJmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768239846; x=1768844646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R2PM847sZezm8qMDrlA/C+aIUOustWEHzoWUNlVlTog=;
        b=JBnjQu8EYi0tmI49U3ITb9W11AqFrb/A7iyTBtes+Bms3oP4npZhZhgnL3o5f6Rra0
         xNmGRs4H4MpJTcrJwmWx/pHCXyioTd/HZQ7ZFcDHBFCo2OjLWaMnpWcddFA/5pjzSmYR
         5SKY5fZSdKME/uwjHShkswLBA/90G4TkrQN8+RreqB1cs9sDMcbJ1SaZ6f2we6FqnlDb
         59gKWraYjlfKZUeNimAxpYFiy6HRHZhoVPZGsLHl7n7lCm1zIqWpT8/DnYTJ8pvW4SR1
         iqO+5PO24I3r37m40jrEEEWR/ajgSS75LVpGBcaNuEcFkrKaR/FAtVDCJoM246jvVRTJ
         peag==
X-Forwarded-Encrypted: i=1; AJvYcCWgQKH7dN5qhe/R0Jm1KgBoNVOeJQYYD4o+RnppS2RScgi+7QUU59cQba18rcbHU6/xNtgo9F2uLFQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzjs/MPVDZ2Eo5eUSdYJZDPyujReafPa+jmSATXXNxCxnOOG4J2
	jnKRVd412Jr2BNSJIAnY4xZIYWHdarMD6/IepkGYb1cKugHb8tWvqWD2
X-Gm-Gg: AY/fxX5xnesQCwjAYy89PRC4lLzr2U7CdF7vLssVq96vyhklXRy2fIWcskcv1qn5f8I
	PnATyweeRgiZdxT3WIJheOlFPijUWooxkuwX1OHj9Q8rxlOJ3CskykUhNU7rJ7cocC7t3NCRlGP
	7Fs1Sm8G0Do0TkBFE9ez/EN455zKl/Mqy4125Nf6Wo+M6aIdieJ60JmBpQtPqbjs7whRF4hlibE
	8LcpwbYfTSv8fyA4nY8GdGREgOs8SPZtGgdK0ekaTOqH/r0PdCyOHdHuVNC/YEweypf1F+TmTJ9
	f3ReSvW4ov4jo30EHV2zUbhKoE0auuXVAJp91wM2zXXaQtoTpiqBg9NagfiF5iwL3Did0XMPB2O
	lBFrTsDNpviYbfQAWeEJbsfkFIEsp96PDU8m/ouPqekTUXkTfE2tk2moVdlaXljMv4j7d3gWdWo
	+eTRCCnct9zRA5NSwf
X-Google-Smtp-Source: AGHT+IGowUCnuSiMnioYOycVMCYNDWoins5qO8gM9NE7dzQF7NX5CSOPcjCucNoQ3IUz8H4VDDdlYQ==
X-Received: by 2002:a17:90b:1e05:b0:32e:528c:60ee with SMTP id 98e67ed59e1d1-34f68c00a7fmr18286724a91.24.1768239845962;
        Mon, 12 Jan 2026 09:44:05 -0800 (PST)
Received: from rakuram-MSI ([2405:201:d027:f096:5c52:f599:118c:bed2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c57a50da1a7sm7310733a12.36.2026.01.12.09.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 09:44:05 -0800 (PST)
From: Rakuram Eswaran <rakuram.e96@gmail.com>
To: mailhol@kernel.org
Cc: corbet@lwn.net,
	davem@davemloft.net,
	edumazet@google.com,
	horms@kernel.org,
	kuba@kernel.org,
	linux-can@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mkl@pengutronix.de,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	rakuram.e96@gmail.com,
	socketcan@hartkopp.net
Subject: Re: [PATCH 1/2] can: dummy_can: add CAN termination support
Date: Mon, 12 Jan 2026 23:13:55 +0530
Message-ID: <20260112174356.10358-1-rakuram.e96@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: d058f82b-2e2f-4353-8518-2cc9e15f7a98@kernel.org
References: <d058f82b-2e2f-4353-8518-2cc9e15f7a98@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 1 Jan 2026 at 17:42, Vincent Mailhol <mailhol@kernel.org> wrote:
>
> On 31/12/2025 at 19:13, Rakuram Eswaran wrote:
> > Add support for configuring bus termination in the dummy_can driver.
> > This allows users to emulate a properly terminated CAN bus when
> > setting up virtual test environments.
> >
> > Signed-off-by: Rakuram Eswaran <rakuram.e96@gmail.com>
> > ---
> > Tested the termination setting using below iproute commands:
> >
> >   ip link set can0 type can termination 120
> >   ip link set can0 type can termination off
> >   ip link set can0 type can termination potato
> >   ip link set can0 type can termination 10000
> >  
> >  drivers/net/can/dummy_can.c | 25 +++++++++++++++++++++++--
> >  1 file changed, 23 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/net/can/dummy_can.c b/drivers/net/can/dummy_can.c
> > index 41953655e3d3c9187d6574710e6aa90fc01c92a7..418d9e25bfca1c7af924ad451c8dd8ae1bca78a3 100644
> > --- a/drivers/net/can/dummy_can.c
> > +++ b/drivers/net/can/dummy_can.c
> > @@ -86,6 +86,11 @@ static const struct can_pwm_const dummy_can_pwm_const = {
> >       .pwmo_max = 16,
> >  };
> >
> > +static const u16 dummy_can_termination_const[] = {
> > +     CAN_TERMINATION_DISABLED,       /* 0 = off */
> > +     120,                            /* 120 Ohms */
>
> Nitpick: no need to explain that disabled means "off", the first comment
> can be removed. Also, to be consistent with how the can.bitrate_max and
> can.clock.freq are declared, you can add the unit just next to the value.
>
>         static const u16 dummy_can_termination_const[] = {
>                 CAN_TERMINATION_DISABLED,
>                 120 /* Ohms */,
>         };
>
> (above comment is notwithstanding).
>

Yes, this looks better. 

> > +};
> > +
> >  static void dummy_can_print_bittiming(struct net_device *dev,
> >                                     struct can_bittiming *bt)
> >  {
> > @@ -179,6 +184,16 @@ static void dummy_can_print_bittiming_info(struct net_device *dev)
> >       netdev_dbg(dev, "\n");
> >  }
> >
> > +static int dummy_can_set_termination(struct net_device *dev, u16 term)
> > +{
> > +     struct dummy_can *priv = netdev_priv(dev);
> > +
> > +     netdev_dbg(dev, "set termination to %u Ohms\n", term);
> > +     priv->can.termination = term;
> > +
> > +     return 0;
> > +}
> > +
> >  static int dummy_can_netdev_open(struct net_device *dev)
> >  {
> >       int ret;
> > @@ -243,17 +258,23 @@ static int __init dummy_can_init(void)
> >       dev->ethtool_ops = &dummy_can_ethtool_ops;
> >       priv = netdev_priv(dev);
> >       priv->can.bittiming_const = &dummy_can_bittiming_const;
> > -     priv->can.bitrate_max = 20 * MEGA /* BPS */;
> > -     priv->can.clock.freq = 160 * MEGA /* Hz */;
>
> Don't add unrelated changes to your patch. Your patch should do one
> thing (here: add the resistance termination). If you want to reorder the
> existing lines, that should go in a separate clean-up patch. But here,
> there is no need to touch those lines, so just drop this reorder.
>

Ack. I will revert these unrelated changes.

> >       priv->can.fd.data_bittiming_const = &dummy_can_fd_databittiming_const;
> >       priv->can.fd.tdc_const = &dummy_can_fd_tdc_const;
> >       priv->can.xl.data_bittiming_const = &dummy_can_xl_databittiming_const;
> >       priv->can.xl.tdc_const = &dummy_can_xl_tdc_const;
> >       priv->can.xl.pwm_const = &dummy_can_pwm_const;
> > +     priv->can.bitrate_max = 20 * MEGA /* BPS */;
> > +     priv->can.clock.freq = 160 * MEGA /* Hz */;
> > +     priv->can.termination_const_cnt = ARRAY_SIZE(dummy_can_termination_const);
> > +     priv->can.termination_const = dummy_can_termination_const;
> > +
> >       priv->can.ctrlmode_supported = CAN_CTRLMODE_LISTENONLY |
> >               CAN_CTRLMODE_FD | CAN_CTRLMODE_TDC_AUTO |
> >               CAN_CTRLMODE_RESTRICTED | CAN_CTRLMODE_XL |
> >               CAN_CTRLMODE_XL_TDC_AUTO | CAN_CTRLMODE_XL_TMS;
> > +
> > +     priv->can.do_set_termination = dummy_can_set_termination;
> > +
> >       priv->dev = dev;
> >
> >       ret = register_candev(priv->dev);
>
> Aside from the above remark this is OK. Please send a v2 with that last
> remark addressed. You can also add my review tag:
>
> Reviewed-by: Vincent Mailhol <mailhol@kernel.org>
>

Thanks, Vincent. I will make the change as mentioned above and send v2.

Best Regards,
Rakuram
