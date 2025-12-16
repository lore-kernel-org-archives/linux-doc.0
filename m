Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BE32F0692
	for <linux-doc@vger.kernel.org>; Tue, 16 Dec 2025 14:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765895746; cv=none; b=WDl680D2rAECS6o/veJg8RSbAhQjx6yWZd1lUTc+fD9MSESnmLUXJwQoCrCBabmn9IAzYsF2a1D60b5m4q5Af2ox1U1TkLyThSDlEjoi+EC8gnaQNdHDL6ecRg1KBSKz9V8JIkGrnztiDrmQn+A0thwnLjd6DgS04UEec95iV1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765895746; c=relaxed/simple;
	bh=bRJifwBpOn5/UKOhHLvWKxzpriP409m/28t9c1F6o0w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MbNvIWbn5bMy2MTi/OOLSkXdPXFbNJExe8ipOhHdeDQUvRMF2Taetj4RPVUFVx/UQelVcjFlaYeTifaJiSAw+4I8onMK6yRz+deSSwXf8f2evedMIcvmU2rYkwiDEWZmky9241CLnLzH9LKmffbt4bMl5Rb1iTubLXUxU6kwYrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QJ9MC+No; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=HI9DpcgF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QJ9MC+No";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="HI9DpcgF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765895743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bRJifwBpOn5/UKOhHLvWKxzpriP409m/28t9c1F6o0w=;
	b=QJ9MC+NoH4FGxx/AfjEIX/r6BJ9oiHH5RU7W2BpTnib6LSR23WcE7ntuVBmRraUEX25277
	GKzNw90biS8eJVO07/8969YkL8TbvpJKZNcHUFjsJk+oWfgPGAj6d4PvQG9OMCEU47TpDj
	5YpalZnl3NWBxB8GQXXfTQ5+F2zGmnU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-sp8q-zY2O56wWNUCy6M4qw-1; Tue, 16 Dec 2025 09:35:42 -0500
X-MC-Unique: sp8q-zY2O56wWNUCy6M4qw-1
X-Mimecast-MFC-AGG-ID: sp8q-zY2O56wWNUCy6M4qw_1765895741
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-430fcf10280so1586842f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 16 Dec 2025 06:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1765895741; x=1766500541; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bRJifwBpOn5/UKOhHLvWKxzpriP409m/28t9c1F6o0w=;
        b=HI9DpcgFTcq7/oQoiFTFel4T/ubbksw5YSYskJwMcDLqPmqBc9CTvgqBYG6kiKoVwD
         g0fWPA2S2naqgi0gqI6EXx1y/uJNmkzZBUN6ulhQaw6kIeqQKVAszTshlaTiBt8uDZY1
         Lh0R4QDmL7P3ON4NjU/kPbimDrK8SzjdxDwDo9HC5684YzUqBG5xrxYCRqUQ7Vf6+ANx
         s+m1DzfIsj3N6CRJtj171bn4CTIl4j7gw9o+cbxhjYRHY1E9g7wZADuE9bxBsMzzIzSB
         78MqVqeY4E+ULfTPBm6uWxQTAkH/el7PdxfTBM7hR1XhnYfZAJ2cZ/4Ag9hcaPKAQM3x
         inYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765895741; x=1766500541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bRJifwBpOn5/UKOhHLvWKxzpriP409m/28t9c1F6o0w=;
        b=fjgA+LT0HseWEmjEp5JUHjC+N9uYnZOb8LxWNEhP2zozSt5grZIqgeAgCCwSv65X6v
         memjosPu9FccgS1jTTB+jxqba4qxwsQ4BBPw3Zd0v/tt/bE3fZGFhS4toHl4U+FrqiW+
         r1Rf+Ln87TLX/0liMOXnZ4p5rUFAa1iCFJA8r+T2ctZ00SCV5g3zIW2d9wwQLQ1FPr+X
         TG5hUulV1pWFESc4Az02SK47IC1sHCOJB66E0APzdkbB+aU5gEE1izwhlTNudOkEAsh9
         j5gps3UnF25C8qKR8RfL27k1l9kaN2+lpkjfBKAkHo4JGNtYqWA6up/zHBy3MmBvUrc0
         DdoA==
X-Forwarded-Encrypted: i=1; AJvYcCW2Vr49ufPTiGYYNsebV6ODIwSq/P7T4l1BkG3UBn/StSiXw/bpF8Es1OM5LRieUyvZh7BKL++juM0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUeK29Mjih5llmfP9INubmxZ3FEan+tXeq83tWKuVPiy1pXbS4
	AkuOBJDj2S5ukJMxwAtkLM7BBZ1b3R/AnRUCi6zwyPEus5vEPNRPvzBfRDfA+y7fdm3jz8bCEz2
	IZZO4qYNRAz2o8hqxFc//YDn+/eRuTzjCXcjp0m7r3u7ywiQnvls/CQPqKerkeQ==
X-Gm-Gg: AY/fxX5Tb3mnyyAcKW+wZBBEVM4VWQDCl6dGLhhleGpEbWzi3R/X0Sq01gTtL3VuDTx
	G6VTNfydjTUeDxMGiIcWK0BuVqG2xpfhxDwLsIXWBnAM6c2CgTgZky0hMZgPSt82bEJqQ5burI2
	jp0WIUHYZp1bZ09jn00xPLT2KrmRimj8kfWJ36Oj2dIcKW/zUlruDjW+2ynB/F9EmEh1lOcTT3Q
	JbC5h01Bu+CS2XWzbSEmsJa/QTwfKoNphmPpU6VJx/SUyyexqqIG/KgHzureVsSpbkAJURKsgqf
	94bD/7b2wWU5bAFwZ1pSSlgqoz1dKKOlSo2/p+BTVUnkQbdJHOTCXM8PkgfvGr9uzZ4CmGJAxGU
	hRpgM7XyNo7z85vtMXVlM+orldWBjVzY2Jo/dN/mKme+ZK/g122PuTZhhJg==
X-Received: by 2002:a05:6000:178e:b0:430:f463:b6a7 with SMTP id ffacd0b85a97d-430f463b786mr10423854f8f.45.1765895741327;
        Tue, 16 Dec 2025 06:35:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEEiQf6BBDsC38L/5VWuZcUazJwh3+kQd4Ox+qhR2hGcQAYTsyHnr0moIxAY07XF4YHlOkdZw==
X-Received: by 2002:a05:6000:178e:b0:430:f463:b6a7 with SMTP id ffacd0b85a97d-430f463b786mr10423822f8f.45.1765895740892;
        Tue, 16 Dec 2025 06:35:40 -0800 (PST)
Received: from air.bos2.lab (IGLD-80-230-108-89.inter.net.il. [80.230.108.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42fa8a09fbesm35964873f8f.0.2025.12.16.06.35.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 16 Dec 2025 06:35:40 -0800 (PST)
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
Date: Tue, 16 Dec 2025 16:35:38 +0200
Message-ID: <20251216143538.14975-1-vgrinber@redhat.com>
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

