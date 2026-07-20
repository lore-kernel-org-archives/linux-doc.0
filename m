Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76197369206
	for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 16:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784563830; cv=none; b=SJuox9cWUBKKPzcGszzZkYBzrTi2Cz0DuetO95jTyBcnawu2TJCfnopNsFG1JssJyAKcbKYq1yzM4zZx2g7IAJeU6bJTpbHPEQGwjfyr5YlDTfmMB0J0mAbCsDy8U1z7Rh5OIXMerbuIUPSdKrhY7ODqVKDbKjoAoIUi17ctm+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784563830; c=relaxed/simple;
	bh=yn9KL+gzo5WCfpKnYQt/rCA8kAl47sae10Qk9mMRStE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IczmNkwur/gc+eDDAnryrmtEo6J3N+qDD1i23RfgCwuDuJvKriUKdKwgyCelidvDtoU+IsRzIMMHJSCAEij3obtsueqOBnHvx9X5McKwNOIfKcQFwV6BhxYxSQ3Oj7OCLsKJwVudWrIfH/WftSTytFbrcwtdGqouLloMDTknO1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jN+Ady4l; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jN+Ady4l"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ccdb73f0e1so63107485ad.3
        for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 09:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784563829; x=1785168629; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PlPWzBPmCzPImVf+9GWi56cJVlswcuLHqcL+2o3RaBo=;
        b=jN+Ady4lw17M5yDYEPMlSGKEZ+qyjVhv6foYaStiKaFZAWCpFexHglEllE3ryTrac7
         kAKEe1t6ZjhCgnEPkqdC9OrEsd4lefxlj3sXcgaRYr4lNc+p18OxbDseBDSbBumjepvP
         VMVtc7B3x/JeT/z6mNjCu1MhaWSK1PbtWH4VKm+KOtFEdfiTw/gGqPaXmUwp3QZUWFL5
         e+G2YWi9PjViEtcHUSPLUYrFFsdcMnpSqZgNAyZ4FOgEqNJeXUzscKVQEjLXmrgu+cDx
         Pnz06eW2Zc+XzYCkTW+/86+ZcVBTbyGk5KkBuk9guDRlB3z4ZlZ1ziwtws6Q4pM7dLim
         sbqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784563829; x=1785168629;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PlPWzBPmCzPImVf+9GWi56cJVlswcuLHqcL+2o3RaBo=;
        b=ORspRDjxVBhH5neVDnejxHqyPEJR0CT47m4Ib205ZitOhqp9YjIokirggW6hG9AE+r
         g/MwzrUVTtWPCBY52SdWdi/4JaIReDz5b7ABwVcTxiPMFdT2mOLXcYKbLgOq4G1Ac3iO
         Fdq+nxUL0mgbc1WM5+WvMv3KPul2gBABBnbvN5XqIMazHWShO4wykG1414vFXF1EGKJb
         SjM6a+DgarwbKzdMGq5Xex9+NBBBSSXTDUpz4WQCe9DlPTUFlf0gpQS93i0Dr7D6f5ve
         1tUqP/7HLofSq7QNPxeB4px8QLRbrGtlG7JIj0hlfw8N4ESk287yPwnToacxUU+ju4ym
         +OSA==
X-Forwarded-Encrypted: i=1; AHgh+RrfYeapZcgnbtrbRe+AEBC8ecf6Qi7SYn+Pwrxe4oqa8MsHUe0nEuKOqh5j1dJLqBTR2cXZNJVrTr8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzyie2KtP9Qib6qjau6K+DTqN06hMyG78xug6qHaAtOLnndgbp9
	6F42z1hfuw54Hny39T3LOPBngk19EJdPAPv0s5ahwALeoOq6jh+97Ejz
X-Gm-Gg: AR+sD13lwe+935Ol7cdMr5WnOZxscFicSfpghNVCHnmtMHhLuBJntuOexzzMweqMpOO
	Tp5J004WYaoMn5BPe28EXu7mYNVYed0RB9F+xxMT7FoKBqZzIIGfDOmzKj1kShPr2GfE50P9z+X
	N+ulAkPE5bvxFYUDjw2BiBDaALiKrc7bTuuE9Pygiti7AUxmwtEYExPDI6uoKhmc031Qu6tRgqu
	UyoYRkzQMqCf3E9TMsdaIK2iu4jPuIQh9bzldaqUniWWCHud0NQ+cUqyYf2P424RFxKGMDXxPFW
	vdWFmRtK7GEIEUUULmLUf6/ymeg0XCiiE7lGTtqmaJ1kCg0c+F5EOR45YOGIy3MNAU+CY4+1Pc0
	nVteRilbI+81h1u3h4JM6xx/EaQKP0yCaf1pkpwsrmEs+vh+imrgX4X2Zt3x7ltwLtsWquOgLM9
	/2115at+NDY6cjzEsR+6tmc+Jx0Q==
X-Received: by 2002:a17:902:d4c5:b0:2c9:2ee6:693e with SMTP id d9443c01a7336-2cf34873ddfmr177182215ad.18.1784563828753;
        Mon, 20 Jul 2026 09:10:28 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a20b037sm40185272eec.27.2026.07.20.09.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 09:10:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 20 Jul 2026 09:10:27 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: andrew@codeconstruct.com.au, wim@linux-watchdog.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, openbmc@lists.ozlabs.org,
	linux-watchdog@vger.kernel.org, linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	avifishman70@gmail.com, tali.perry1@gmail.com, venture@google.com,
	yuenn@google.com, benjaminfair@google.com, corbet@lwn.net,
	skhan@linuxfoundation.org, joel@jms.id.au
Subject: Re: [PATCH v4 2/3] docs: watchdog: npcm: Add reset status description
Message-ID: <ebe0fffb-eeb4-4dba-ae8d-7153af6c2fbe@roeck-us.net>
References: <20260706144828.3517631-1-tmaimon77@gmail.com>
 <20260706144828.3517631-3-tmaimon77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706144828.3517631-3-tmaimon77@gmail.com>

On Mon, Jul 06, 2026 at 05:48:27PM +0300, Tomer Maimon wrote:
> Add documentation describing how the NPCM watchdog driver reports reset
> causes through bootstatus on NPCM750 and NPCM845 systems.
> 
> Document the reset flag mapping, the watchdog instance mapping for
> WDIOF_CARDRESET, and the NPCM750/NPCM845 latch handling. Also mention
> sysfs bootstatus reporting when watchdog sysfs support is enabled.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>

Applied.

Thanks,
Guenter
