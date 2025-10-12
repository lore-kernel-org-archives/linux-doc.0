Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0E72EF665
	for <linux-doc@vger.kernel.org>; Sun, 12 Oct 2025 18:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760292658; cv=none; b=L9gcDquLXittpBTUZf4GeGphpmGvL2cEq/t2275JeB0BZne+q3Vp7Oag7xv3olVBmtJWD7MdL2FwZcAVQ4/9Me8wCApeI5xzbI0rlIbBalyFvD127M4sQ6Xw4cOCvo91Pdv9CqubiRmeoDgenI3Afr8EzM37mWoCvq3fh4nHBzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760292658; c=relaxed/simple;
	bh=NJhSNDeWNvONDKstagZ32g7L72fXk7hiPZla9HLXGTI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mpYxfuTWgXF9331An8/b1nvdrJAdFIxG6g4hIIJevmr96L5SOjQRnRt6gaIJpVgN0EB3PSZVYiYT/68U2jjJoOvSZsvNqjYqHrhqKIqp9eCw06PPR98eioC/+T+36bW95B+rIsKPmsqewjA1PaQUYPQuhHNfA3Gxf/hny2PQBDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jzfy2az+; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jzfy2az+"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-339e71ccf48so4982270a91.3
        for <linux-doc@vger.kernel.org>; Sun, 12 Oct 2025 11:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760292656; x=1760897456; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NJhSNDeWNvONDKstagZ32g7L72fXk7hiPZla9HLXGTI=;
        b=jzfy2az+GuW/ZRQThfGlruSOndEKBSeW2Ubk8/8e8TwdfMXswx+LT/xtSchbGJJPht
         8HdjgVH4gscXiC9wPSP8edYUGLmeDgPE8PhaVmiItK+6vHxV7Ov4vVJzgiX2ejN6Rw5Y
         VlDcnelsPMOwJWtEy29HkR6KwGBYY/X7hKUHuKIB2tAy3nk6SkCchD1O7IEzKfMn+p/T
         Z+1SUWnbkmPHOuKle2XpAdDM266WSAp7VRcT2V9uaCnS+pdw+gM5Zxz+Bzt4N806fym+
         P4EzDO3EaEcngEaCmdf7EGdjpNrcsn/u8y+oAf5WRLmHdoGVKlnT88I2i0BsWrlMoXfS
         oDNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760292656; x=1760897456;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NJhSNDeWNvONDKstagZ32g7L72fXk7hiPZla9HLXGTI=;
        b=vZx2dwqcINuC3FTAVlhOVlqE6k+ptvmdpFWpzDgwj+lVWDwMLW/jJXkyjdvTaA+W0t
         IHa32YkJ6XDuGi6uJCUCVxHIHPDRR5qfFsvLDpGiJPhT+2HtcfSvSLycpWP2UxTldU+V
         FOEJjMgJGC/sZ0pTe5BV0Ydv6DujtwpP7DXznNxr7JJlG0ua8ZTB5CaphKRBNQD5ysi2
         h2yvsfn4U4JjVZYvYBliqcj953yxn3o+CM9rBpTkZUrbgKNf/hlguTo8un7/gDOGT1x2
         D6Z4f8yXZAai4Yb7+Y4hN8cke/AlQgSMaThMekvoPy8q4PsSj08gucKESF2f3sDnqveL
         PyYQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7IZqIpD6IwDItydGV58JX41deHS6i9qMDLHrmYwlu7CRLlRokbQlnLt1h91LrACL3p/UIlIEdTYw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+Qu7mqdfnh4cwPm2cMFSishfL6unt5UqWBkumqvjDeq3KnvZ7
	iXDTK1RcEq3z2udh1PwXcFt2To3hiHScmWaqxn2dIv3K9xomcRH8PSmdEp4TAQ==
X-Gm-Gg: ASbGnctE1pGMo2lDEn/gN61IAx3mph+bKkmMbtd4XV8UtCPFrrFuOBRgMRSQd3F5d1a
	4h1nqZKz7zHbgYXmsotLgEwEBqIzgmYMNp4cV3UwW2Tq8QBrvuCKIIGOuQtew135p0eesdzc4RP
	jiSaio+ShxkE74+ud708lMIRJIO7Yt821aUJIuFxP3fL7J6/Maf2rre1gTBlPyoYDieHe17K9uN
	Eh1WgGFsT90ddbOEkGDrbRlcNstXFksKKlI5N18PKCyY/LXI3S9fVZpi8h/wP7JkVu/6gIC/d/Z
	GsfYn90SY5ASm93h0xt7d9L/yHwZx3qhQeg+jhG7rk7LbbNlvPYX8Us9eymQpsJ79NYHjbbqfMK
	tVuuVoyNpvNNghKElWlruGc9INF/v1IL/S+4utOakzsDDzbxO+GJz6dpz09Sbiped
X-Google-Smtp-Source: AGHT+IG9/G7m5BIzR4diatr/nXRqe5D/3HvVmLeZh5LI0vpljb9ZCvWzlgmVMhvlJVDTxVmvWVWgFA==
X-Received: by 2002:a17:90b:3b86:b0:329:ed5b:ecd5 with SMTP id 98e67ed59e1d1-33b5127bf42mr25738231a91.19.1760292655903;
        Sun, 12 Oct 2025 11:10:55 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61b12756sm9564411a91.25.2025.10.12.11.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 11:10:55 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 12 Oct 2025 11:10:54 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Gabriel Whigham <gabewhigham@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: hwmon: fix =?utf-8?Q?typ?=
 =?utf-8?Q?o_in_sg2042-mcu=2Erst_Fix_a_spelling_mistake=3A_=22supprts=22_?=
 =?utf-8?B?4oaS?= "supports".
Message-ID: <a88dcdc7-f6a0-45f9-b39e-deb5b7182b9a@roeck-us.net>
References: <20251006001808.16962-1-gabewhigham@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251006001808.16962-1-gabewhigham@gmail.com>

On Sun, Oct 05, 2025 at 07:18:08PM -0500, Gabriel Whigham wrote:
> Signed-off-by: Gabriel Whigham <gabewhigham@gmail.com>

checkpatch:

WARNING: Missing commit description - Add an appropriate one

Guenter
