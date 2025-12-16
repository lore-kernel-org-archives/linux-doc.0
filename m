Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0E734AB16
	for <linux-doc@vger.kernel.org>; Tue, 16 Dec 2025 14:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765895242; cv=none; b=SMvSPmMeyLTjim0vG3q4++vhFNnOcrj9vGbXByoKV6/ZuNfpLIOXzxa2m4fvLiJRM+oylwTLLC34A3c0mv9AMHVEHI3Y/73RZca/QDyCaCkbpgu3yRX9x0qmE6l2bK6tCj7B9to/SC5QknSgq16Tqvif3yLagxFEq4wEHl7Q7kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765895242; c=relaxed/simple;
	bh=bRJifwBpOn5/UKOhHLvWKxzpriP409m/28t9c1F6o0w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VODnLYTmeoavb/afJ+scNXUXYIJnQiQXWMXmfUKeWOF/yqNufFYmWofXyweXKiad0bd7xeReGqx1UoVxYRie9PuoAiM2o1wGs82rnG1loCRYL+curA5vT25A2SlDZ/trn8iPwLMvp4DYYfAFlgRYGOCQy4qAyB7zuXKJyh/l6C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LpEtvWbh; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=hRYZ1uOd; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LpEtvWbh";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="hRYZ1uOd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765895239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bRJifwBpOn5/UKOhHLvWKxzpriP409m/28t9c1F6o0w=;
	b=LpEtvWbhH7kHi98N0WchyANf/OwPzhCiLeKjEHVIdpYU7HvuVhXMOAuP3VCA1ZxoLB35NC
	5LwECqlqH3Lm/EIFTWkKhLjIEA1fiIx1pHNuaUPITzHmY+wj2ppBcnIsaAGr77c9BqbOR1
	c82KNq8W9WKkLIfR59cps4WUPVVkOq0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-107-rFheMMEXM9GJpIKDlPiE6Q-1; Tue, 16 Dec 2025 09:27:17 -0500
X-MC-Unique: rFheMMEXM9GJpIKDlPiE6Q-1
X-Mimecast-MFC-AGG-ID: rFheMMEXM9GJpIKDlPiE6Q_1765895236
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4310817764fso384150f8f.2
        for <linux-doc@vger.kernel.org>; Tue, 16 Dec 2025 06:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1765895236; x=1766500036; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bRJifwBpOn5/UKOhHLvWKxzpriP409m/28t9c1F6o0w=;
        b=hRYZ1uOdayBnW2Ulj8k40pc1ECvNHLMa3sjwPFxr1EPLWXsM/tLGSntVBJQM1LSFnz
         HBDqrl72iTVElSS++337DW2Ephh1SdlIZxLHeLxvzRHbUvMIoDFReGTRx4BJmgGsKvTN
         /pCfsBmFG8O54y0HhxjNTDAkMsVwglr+s8srucEdp68ljEjshtTk8ssjhWlxmiH4jjA+
         d2jEdfABW+ItFK60Z0SY6/hSUQbIpoJ60Unp1gU+WDhk1G5F6zhLWYm/f+tr1tLt6rOz
         pqSlElBV2pHsExz4TiL3W/p9qnHMSh1+N1y2T5G3ERmYU2+7bmc4a+h/l9yndgIoR0R/
         hAvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765895236; x=1766500036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bRJifwBpOn5/UKOhHLvWKxzpriP409m/28t9c1F6o0w=;
        b=csEKcuuhvUk2WW+n9MqxPa5t9Ukx60YdmIgyMHy0rbNCtqXCP7iZ+ZALTTYki+T8po
         ztAk4+Jq0mMpxk1XOu+6vsccZBwrWS7jkj9jgQWhsE36IqcAWl6tBeA6P1yYdjazwuei
         Wp0hEiaHzDn+31q15boYTFFjXxaJDs1I40yx3cKD415yKfEJG4Mmln014YbUAkCqwkID
         Q0jymnvvQpu1ezWOcQ9jflwX8O+914mtmv45u8wcH9ICioAkQcUe0xHMT9wvidYRXAka
         oQGLI/znVcnCal0KpZNb4Qr9jJbu2WVVODJc9OQRlVNOiQkReENqsZlPoM4QAWMQHgjO
         Dh3w==
X-Forwarded-Encrypted: i=1; AJvYcCXIK79y2cr2J+tVQnRVJYYtqYH5xwF9FshrW3xG1xvPg2umMJB5FtpOxwKBxSY1OBSgdpTGzRzUEg0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSFyQt74hyA+G4SGAJoJ0zsvdGQOdTFOJfX5SKhXCX7TXwEVHM
	qgpso6zxChX/tsZj7b3T/Ln7w1r9Jho4wcg1mumIWHjtl7C2qYp+UxHtEgWgg9bG8uo/IySNaZg
	J9EpD1TYkmb210HXZK67hknD7r9V8py4sBDBzvwI/DTGvWAzBPJmvbYKsmTm7SQ==
X-Gm-Gg: AY/fxX403kixt8b3waXrR6hMnIvMay2FlkPcdzikF/UffzLrMe4jp9bWDJfhgIGLAMy
	nxzx6ZRvpuL+ge/j8OrQmGtc2SRvAOjPSQHeJdbulaibC8u79lyzLMUthmMLImQKazLXAS8KwWt
	0OMNVqHKYqEQOWo2uN3p7yZ9nvD2gHoIbif6rsW9Em0fq/U0Y5EZ46ruwaD6twOQN4Nhjg4eDFc
	jHZt/oG6AZkZbwqmEul57YUDweE09D0puIiUg88J5oCrKF14pYw1kxjy4kwgOHN71mEgqP5+g/Y
	IR4+D7wnoHs3QFyQRQQcYGVt99WSGLJgIbf+thhcMc3dzy1WbH2T+bH4HxRhadSwJMs57+QPmdU
	wkK1YEIgpKnmirvS3EVtGtz6a0rJGExlSB9qWk/OTFneGH97iBJRUMqaSsQ==
X-Received: by 2002:a05:6000:188e:b0:431:a38:c2f9 with SMTP id ffacd0b85a97d-4310a38c454mr320334f8f.63.1765895236273;
        Tue, 16 Dec 2025 06:27:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE+ix4WzDep1rU/6+82Brj6lVB7AwDo2uS3uSX9AUtyHY1SENwAUhiUGkaJJ72DpisXXC83nw==
X-Received: by 2002:a05:6000:188e:b0:431:a38:c2f9 with SMTP id ffacd0b85a97d-4310a38c454mr320295f8f.63.1765895235805;
        Tue, 16 Dec 2025 06:27:15 -0800 (PST)
Received: from air.bos2.lab (IGLD-80-230-108-89.inter.net.il. [80.230.108.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-430f38d01d6sm21017928f8f.8.2025.12.16.06.27.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 16 Dec 2025 06:27:15 -0800 (PST)
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
Date: Tue, 16 Dec 2025 16:27:08 +0200
Message-ID: <20251216142708.14727-1-vgrinber@redhat.com>
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

