Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9698017A586
	for <linux-doc@vger.kernel.org>; Fri, 11 Sep 2026 00:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789088238; cv=none; b=oaYz/HxhT2Oe45ceWxBjSnw0zVrYJrkAF4T8Xd5KN1PjFtkEnqi/f+kK/zO2zruljZu0/B5MaEtWC4CIUr+j5lXbAcVYskukOy4uVxbqp6LnCaDefW5gYob8SVQALtUe3GiAu4FQ0Zy+icrW9VKEQKLITaShNoPF1GqzaW6tag0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789088238; c=relaxed/simple;
	bh=JUap5E1DZl/YpLqiDruLb48iQ9UveYL5LspTg9y09LY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g9be0bU2H9EAkcAWtroZaPbbWq5JxU+YFMVXLPelbR+QfRi52oGaHGqZAGbg/F66ECd/gSBUVH3lEXe+LVZTSw5XuVptyzh5x4KYPKLsgNJ87iN9sXG8FjrHMRzsUXJKk68iQaaLrNvEvpJkWg5IGE9BhlI9iIx11nhN6mlXib0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FSKf/ZXf; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FSKf/ZXf"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2dcff8f44f2so4821545ad.1
        for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2026 17:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789088237; x=1789693037; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cBCSAfSzWr7/938AC/KnuRa92ipR1b0xd/LyHiEtjPw=;
        b=FSKf/ZXfqheJSTCn1GFfRM5IrYuikHGr2lFr0V9bN636wS0mQeDfUsLT1akfiFMTww
         YTp+rmZLxAk5y2CfDsmYqxmAU9St/fZtwWvBfMLQE8JiO2EcwpKu8fAi1bJVa8KXvIxe
         5sEMLSh7u3AGtmmmoVEI8tvkd3l3ReYx7w1etPUrMy0XfcsQXkCscXRoLsGz6Q5PGeCu
         r6eAYvZZU8X4KpFXXt6qUOZNCiVFH/oxP9UC24Qy6xOcqJGyCysGfK1CzJ/KBPqKhmvv
         rFPoZcyEIfMyuEDlxqXa/b/Uhvu4QkRCmB05Jw18PvrMIxTG1F6SQVs3mRSBAr3O2/u7
         lFhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789088237; x=1789693037;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cBCSAfSzWr7/938AC/KnuRa92ipR1b0xd/LyHiEtjPw=;
        b=Ph/0e+ZSx9HpwUQfE1b9lBVJ1bBQMOK/8i55bwL7n/jaXFN3h9Yv1fFfk0bbY/wz6M
         M/MRBAI7zKGs53OHKB9xOcJIQyijdIBkBTfm09QhTuM/asLYKcBbxVzWBTLcO+bMYNdO
         96HOzFqv01Qug/HNdqld1cWY4jiq6saiP2rEjAJ7ZPicKQ9DNgt6V3Lrur4WXeE+isqx
         zkHVFNvProS8kBjYg2dot83IaB0wVryBFDlAGt9JFZZifkkhBxTcUnSh7pIUgTzGbQEX
         YJkeUBPOJMtaQ/aEIYdVlIof5NBMOhhK8vIY6hXqZA1aH4QKBU4bH4G1PIR62Ue1smP4
         +nxQ==
X-Forwarded-Encrypted: i=1; AKwUvBz4+SzM33e640nL5r2lOEXy+F8N/RXqGX627kDIi34ivk5vAom90iDZKdfhH4sgMOdT+K4a+c/TlJ8=@vger.kernel.org
X-Gm-Message-State: AFuF++kel841eruEhAN5GA2+gzo55+0l4RMkfxd8cD6CFf+nMdan5hPn
	XBBOLZEBAn+VhHkSe/XER45RbkEtO993gNfjgLTjM8F4XolGr2PONrEo
X-Gm-Gg: AYBFou2X1ZesZoy4zkZiJrxYw8sW5AR+9v8FsM9bjbMsRtGze1y8mx/xg3S0qY30dmM
	QS75PC+oiwsHZf3RqxtF0/6xH5W0uCDoLyOcBJig07037umMeZg/yvLuGHGV3NUrDCZzUu3xb25
	CzMFik6Io4Oo3wyvnbczemfeB2rEj208VJaXxkl7fJAQ+v6SG8YioTV7D/AJvHyf5Sm5Qb3xEkS
	5QHzSWwlWHJW43JcerJCoCOrMi/doLEapgR8FyVUI5zcWx5yCWfMHb/hChChGBmtlpyDSmWdX/g
	0fQTO4N46KYNbXNmLZQle49grvD2rtfbOxx/aTxJuUr3OrMpeUosvACUxysQq8kLdpMyynm2867
	tOOsrZgbofqdR7m8GV6fKkN1ONO2PjaR9yb3L6kwBb2vE8xtFB9GhsZDoXREplzDxF5aE8af7rP
	BjS8L607ndxM7pDrloFEedi0xBLN9HpIlnsJpbes+qZxu1B6gkW2G+DeaTZaHGP5O/azu0/r/cu
	nrmDaBWi2Y2
X-Received: by 2002:a17:90b:280e:b0:395:5eec:b932 with SMTP id 98e67ed59e1d1-39d9beb7248mr2122288a91.11.1789088236998;
        Thu, 10 Sep 2026 17:57:16 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e5193dsm1685575eec.10.2026.09.10.17.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 17:57:16 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 10 Sep 2026 17:57:15 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Aureo Serrano de Souza <aureo.serrano@arctic.de>
Cc: linux-hwmon@vger.kernel.org, linux@weissschuh.net,
	arctic.it.hk@arctic.de, corbet@lwn.net, skhan@linuxfoundation.org,
	rdunlap@infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] hwmon: arctic_fan_controller: use shared maintainer
 address
Message-ID: <60123bbf-6611-407f-8f7d-89eb99f29a0e@roeck-us.net>
References: <20260910050401.279868-1-aureo.serrano@arctic.de>
 <20260910050401.279868-4-aureo.serrano@arctic.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910050401.279868-4-aureo.serrano@arctic.de>

On Thu, Sep 10, 2026 at 01:04:01PM +0800, Aureo Serrano de Souza wrote:
> Route driver maintenance mail to the shared ARCTIC (HK) alias instead
> of a personal mailbox.
> 
> Signed-off-by: Aureo Serrano de Souza <aureo.serrano@arctic.de>

Applied.

Thanks,
Guenter
