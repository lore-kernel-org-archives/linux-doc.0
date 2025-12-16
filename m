Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB6733C197
	for <linux-doc@vger.kernel.org>; Tue, 16 Dec 2025 14:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765896121; cv=none; b=Nt/SVYrw59I/74NuBL/spQtwlB/JGKUAY/Pug5n34Xt7PFGpDe1Pihps+F/t4sdupD1uxfM3vcwXnKYvgUmEnCXpqqLnCYy4cyyl/9mnoRxCBNjTDwzBsx9r142RwWgsUnYYXlNOqLtmQNkNNoxpwBBw+cv/Qn5Z5n55DVrBCGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765896121; c=relaxed/simple;
	bh=bRJifwBpOn5/UKOhHLvWKxzpriP409m/28t9c1F6o0w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AY5D8yPrXC/y9NS4rs4t16gcHcVSSGytqZjK4CXjOpKWoz0YFTA/Z5IIUOfeYCJUYs5dougAm/GeLOSWpmW53SYAwwRhWmS4Idn6q1DNsxdy6+s0jNPAA67/rhlROXj7n//SihzSIJVAM+e3f5Aqu9OEQF4+R3CxVKi+BfC68NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GLhWudYE; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=WsIX3RdC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GLhWudYE";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="WsIX3RdC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765896119;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bRJifwBpOn5/UKOhHLvWKxzpriP409m/28t9c1F6o0w=;
	b=GLhWudYELxR7Dxqs422+Xf3v4E2Hik68hkLxsLEYYlF9e5Ny3yD+RtmMfrL3boZw9Fq/sT
	OwP1XF6mSH/534en/VMtCyKJ73pOYbAraw2FUoVU9taqxXhokGU3JbxWOCaYfArOxMJwUA
	/f3cokAkAaq6kTgSLAuwNoMywaYesNo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-573-MDbMtqw5NwGk94hfRX4IBQ-1; Tue, 16 Dec 2025 09:41:58 -0500
X-MC-Unique: MDbMtqw5NwGk94hfRX4IBQ-1
X-Mimecast-MFC-AGG-ID: MDbMtqw5NwGk94hfRX4IBQ_1765896117
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4775e00b16fso32959085e9.2
        for <linux-doc@vger.kernel.org>; Tue, 16 Dec 2025 06:41:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1765896117; x=1766500917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bRJifwBpOn5/UKOhHLvWKxzpriP409m/28t9c1F6o0w=;
        b=WsIX3RdCZ+46s66Vf9dwj+aBeZbWVqhSD21mQ5MQQnEatqkFcLfwRFqQ4xPtiw636D
         8A2zm/Km9Ug/EWLT8fFbg+GFIbgCrpQXipAPak+R69/tkj6yBitEotb5Yd8OyH8/w+uV
         nDk01QmvS2f9d/kUEvzGdQqdkJu15FfYCyJiPLAZLIk/OkCTGNE2YvUR6YIBfAt65Gml
         GuWTLAxtgsGvb7Jo6fNyF1sSqFn2Bs38hBVwmGA7VmcHvm76xExapYPHzz+O1h1oM1/B
         5RLrsJbOqIjPIj7Ys0ySF11J6B0L/M2+8iCxe5dLDfoo1M+jLTC7jY0KJVaw4I2tk/vw
         ATTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765896117; x=1766500917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bRJifwBpOn5/UKOhHLvWKxzpriP409m/28t9c1F6o0w=;
        b=LWD00HcJAlcj/MTHqYIf7eaeCyGi+J/Zidx3OLR7PrivzvSieMcWT5O7zPCbLE2Zck
         m3tN/sJGh4VfsvY67AtG3wKqnina1sbuLk+RkWgvXTyVPVF/N7Rsj8hgaQbk76n5yW2d
         5rqlNhkagDHsHx8AZ619HydwsvfGMkgTWbqHybbQCtws0cT2CpAW6estlAwr3KAXcI72
         JVoYeO1MOJfCg9wtwZvyCh/++UlATEuUFwgH3y8dEitGnB0XENLlRlka3kAK2qAEvLMC
         MC00FcJ97D09J8qgXlhbIuTnWOC5f0Q2eud/ZIdhUcaHKELgHXqCkm+dFIoMCrLci2+F
         ZBAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXpgNEIkaazkJxAPalUMP4LrZmxv+ghp1WtM5qVqFuxLsiKmfZdoTIqH3ILwpKdaQiI6c1GHMW36g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0JL4JBpuDiALXto2oGgFhwAzQgWYj4BNlV0oAX3SB0ydmCs50
	Cyj9aZNAhsC8wjQdVkp95yOJqz+89YYQAGU0QagP6wx+Sdn7d5rkMTQMBen+gmUKWghHHOuP/BI
	4OUrmCLze1RoMEBQ2Hzvh+1K/+VpwFDk4L+LXGLGhsXxmnwUmzpwEGbO5Vmh+5Q==
X-Gm-Gg: AY/fxX6kvBG7FG3RMLlmpiVG9EbHqCHjVUSyXOC8p2Skf8Rc09YRY/3EIS1hyYGxlkh
	GrDGgA9vemqlExJLvxxcbOczo1NfmPK9Svq+PYULz4sBSeu6IZFFoVS24MxrAHiwqapvWGBkmOB
	fYQWeUeT+yBvcr+FMm9Zx9jDWDacTqHlmivIeX3m3Zfd4u6LyyrtVj2aDeE+86h9LYFUfEx/LhV
	YnkarhwJEIyRv1yY7D57+nlWxIE/pktph26i6oYVnp1jY3+20lUkrQAm+/0cgf9NZaPKMq3Zjli
	PGrNiNG5gl6lzuivpUHkRDgYqd3bZ8KKv+jEAfK2oQiJ4kjKewtSV/9R90lybIYOBnH4XBaKB3a
	nN5bPFTaewPkrSmfWTH0RwpkxFC8b6lDboQgLxDkx2Xuhvw9CgVNSdHVpuQ==
X-Received: by 2002:a05:600c:4e91:b0:477:641a:1402 with SMTP id 5b1f17b1804b1-47a8f8ab745mr153358945e9.4.1765896117025;
        Tue, 16 Dec 2025 06:41:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHCHHUOLaChiULrMNPkPpFyOPs7hl3Y2G80tSl6Je//NwD5E5/AOJ5UHYUTERMFN0KxTwrq0A==
X-Received: by 2002:a05:600c:4e91:b0:477:641a:1402 with SMTP id 5b1f17b1804b1-47a8f8ab745mr153358715e9.4.1765896116595;
        Tue, 16 Dec 2025 06:41:56 -0800 (PST)
Received: from air.bos2.lab (IGLD-80-230-108-89.inter.net.il. [80.230.108.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42fbc6e3392sm24205212f8f.13.2025.12.16.06.41.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 16 Dec 2025 06:41:56 -0800 (PST)
From: Vitaly Grinberg <vgrinber@redhat.com>
To: grzegorz.nitka@intel.com
Cc: aleksandr.loktionov@intel.com,
	anthony.l.nguyen@intel.com,
	arkadiusz.kubalewski@intel.com,
	horms@kernel.org,
	intel-wired-lan@lists.osuosl.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	pmenzel@molgen.mpg.de,
	przemyslaw.kitszel@intel.com
Subject: Re:[Intel-wired-lan] [PATCH v5 iwl-next] ice: add support for unmanaged DPLL on E830 NIC
Date: Tue, 16 Dec 2025 16:41:54 +0200
Message-ID: <20251216144154.15172-1-vgrinber@redhat.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20251120105208.2291441-1-grzegorz.nitka@intel.com>
References: <20251120105208.2291441-1-grzegorz.nitka@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Will a notification be provided when the lock is re-acquired?

Another concern is the absence of periodical pin notifications. With the E810, users received the active pin notifications every 1 second. However, the unmanaged DPLL appears to lack this functionality. User implementations currently rely on these periodical notifications to derive the overall clock state, metrics and events from the phase offset. It seems that unmanaged DPLL users will be forced to support two distinct types of DPLLs: one that sends periodical pin notifications and one that does not. Crucially, this difference does not appear to be reflected in the device capabilities, meaning users cannot know in advance whether to expect these notifications.

