Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795032332;
	b=ojCKh9Zcb4xWi2JqejitUp7BWqGV3afrdesT6kdTCgJew5knzdjId9mZF1B/bEMHUT0a
	 21+SisZrtsspi38AEOIoXuVajo2TEkQJci9LpVLb68UoYQSqq8+mZbSb+33V18GxVOclk
	 jH36oEY6TdYYP3/QaLvHqmVTaDTEB9LtK1C4uRc7Ms54K8gSfm1Xab11anOIVxfZzkm5P
	 8lyNx92hgmM7Vr66G/MPKO2iCM3QcsXu5l27Gca2E6/zw4fi/VGJH3X3UdNyD/v6i/J/6
	 T8bzXvFCky8tEQiXIWc4dEHgZpW95SRlguHqGOZW2eb/xnBu4GofkshM94oQuZ/h7yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795032332;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lhY1kQV+0BeRiYIEaScadjDC4jmhduQLLve0FXrFB4g=;
	b=3uUAb9wpnpyxnxXm2jh+48aaAhti8kOIAuViapNk7aCIvlk464ulRElHDKWkVc4/GKaB
	 MWUwXbMvMXirILrHb0+RYMqChJtw0VgIAJ3ND/QmacEtAFwiORhDAW6FlLzrzlqMU6SNM
	 QERLPXeokO0s/PgEYBkEP3G6m4iJXAbGMYRJHki+UsoTrvZbrNUbo8PfYZHm3DPkPCJFZ
	 Zcmw2oZ12u+DRzNlYJ+/tmasOxZS1Jr5lsue1aUtuLe6KrKGKrf1EA/mO15GM/G4v+Ucl
	 sYWRs0fQ2vMx1QxERmn23y8h3UOtRhCowoizrEBXDu8fDQ/v0BPcR7sBn/7cFk5aP2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FY6HgOSO;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86FE60A2603
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 20:05:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C86FE60A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FY6HgOSO
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-380b40312e2so3939139eec.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 12:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795032331; x=1795637131; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lhY1kQV+0BeRiYIEaScadjDC4jmhduQLLve0FXrFB4g=;
        b=FY6HgOSOJk/B1JD5ErvW/oO/+/P2xQrqnVF6SES+Upa4hNTakVRhVg0gowqNRZNFh/
         3+fVjOOYnFMnjAUchXcqaY31if+qJT9qMCyhlKMnBQLgtZsgESZlBdnu49iDYrFtZ7Bo
         hZ0rVXMU0FzNs8zLXO505C2iIV+HrAV3QrEFI2CyCCG7P51W9D7SjpeR/91BBSLUZq6q
         B6HwhU2DHNyYG4zuw4UEpIvDo2BPIZqYV1aVnGOYMAbDHdEGSXKkuqniA8hwAFIkg0Lv
         53dFkXS4oNGJgjtot0JaBj6eesAp1vD+Gt6jXtuM5EnNY3Aq3ThZYtGKWTQAPn69Pn1j
         0M5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795032331; x=1795637131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lhY1kQV+0BeRiYIEaScadjDC4jmhduQLLve0FXrFB4g=;
        b=LDlqlliQZrAr6vT49Osn0lRXa3WwPjlgJxK9C1hJDGdsNXrsDvdF3AmreRB1jAx3u4
         LrpJ86WdViqJy4GA9Hf4ySroHGWAf3QKmaQTyXXCIVUiXdVHvpnhyHJdhRS9zE2qdgos
         99aTraTyVyVfZPkQGVZ/UX/6pMHT7GMUiaxWuR42UwU8yoxkYNFS+C9VHQ/cc93xyiaw
         zsFgphlUmnU1X3bnDFt/LIiqD+29UcFN7EJP/Ieo5XjDZtGtYZDUTo0S+7wLZXkhk6di
         nBhf4omjQtTcZycEyRBjk4WU3svzQ785rGwMpSQ6gIUEhvg7NfzU3MX+xjK9qpXhyRN+
         7PdQ==
X-Forwarded-Encrypted: i=1; AL+hErGv6V9Q+ZOv3ppbPxAFKMXZvlLei1jzggbGypnZ1BCLWs3vnu5HpkM9wrvmWNkQ0zou44TDOSbykZw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/aIEWFpwOOZNcfKXV+WAb6uVVYVSUmw/lCyH0L0DVgjKs8lNyI
	mhZ/QTLkj0y2SgmncMMPVWis6qoVFUo69QhVnp7CWqptaZxmXnox4bir
X-Gm-Gg: AZFdTZfEDxxiHphTSr+Fom+J+Fod1hZIPSftivX/lrMU8zkZYAvPi9epO+NtNVFWvih
	tApMEdEkqzdfCFleX0r+ShNCE9Sjrzny6qql+YBVHWm8PKj0UvoOhyzSfU7QOD5H0OJ4kB9g8DW
	QIhMB4jhHKD3UKbI17E3pWAOwTbC+vd/x+HBJ2aCGYzVWkqGWkkVcJrHaK3DLg2AiDY1HVOfNmY
	TE6d9SfSSsNRgf+eQn9ag+XUMxlZ3ELwoftz6JRAx2nF3LERjv/CvGmadRpCqTwNewjr+Xt8zDy
	xrKeoX5ejVLvNRX6ooA8cABFvfwoKPeBm0OcDJ//FiSgU4iJG+MaXYu7p6IljxAkTzgzYmrFWZQ
	4dXY6ummN6ZqYi1wr87aylmgyD3HMIM5rkv50qvsPwitw+UCFSO9sb6YTm5j0lcJG3Vwk3FVDHj
	BK8roKxOlwjoj0ykmWWiEOT+nTWnkXnQV2R12SHO1bM4+gNvxpKqfw3kMgrK+Cw+KIi+aztYTVX
	HYDYd7uVDK5Hs77JHylSV6haoD6304Z38Tgn2jUUU3Bn7RvtXgXB0XiFUycKMlALj0TH9zBglTd
	7GK+pSF6uDBMp5OD0rDIUoTy0FKh8icg176b0JsQZVtekcCF1MEGjI80D03U/Go+uEtoOeQ+KKC
	VJdu268ISdxfDwX02cP7agTgvmu0h
X-Received: by 2002:a05:7301:77c3:b0:376:2ca2:d80e with SMTP id 5a478bee46e88-38281214024mr2770749eec.30.1795032330636;
        Wed, 18 Nov 2026 12:05:30 -0800 (PST)
Received: from Mac.localdomain ([12.162.234.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a79c96b2sm11032107eec.24.2026.11.18.12.05.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 12:05:30 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: andi.shyti@kernel.org,
	andrew+netdev@lunn.ch,
	corbet@lwn.net,
	davem@davemloft.net,
	edumazet@kernel.org,
	horms@kernel.org,
	jiri@resnulli.us,
	kuba@kernel.org,
	linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	rdunlap@infradead.org,
	richardcochran@gmail.com,
	skhan@linuxfoundation.org,
	vadim.fedorenko@linux.dev
Subject: Re: [PATCH net-next v3 1/3] i2c: xiic: allow platforms to require 32-bit register accesses
Date: Wed, 18 Nov 2026 12:05:27 -0800
Message-ID: <20261118-timecard-common-301f823ddd-r1-ahmadexp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <179502617544.3136.16911407487347494512@kernel.org>
References: <20261116-wiwi-v3-87afa10a8-1-ahmadexp@gmail.com> <179502617544.3136.16911407487347494512@kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks. I have clarified the comment in the v4 draft: the subword offsets
describe the default access mode, not the forced-word mode. The latter
requires unused upper bits in CR, RFD and DTR to accept zero on writes.
It still performs one transaction, without read-modify-write, for FIFO
accesses.

Patch 3 remains the first user of this flag. Other platforms keep their
existing access mode. The revised objects and accessor tests pass; this
revision has not been tested on the physical card.
