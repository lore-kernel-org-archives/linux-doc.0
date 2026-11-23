Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795435137;
	b=WEtNgmGAa4eZCfAXzpUvZYZpdIVuUCeYJOIEIhbcXtRwJtI6yTK129YTDlNIQfG4wK3k
	 yUpq2/L/sQSCKnMvUJaog7VqQjiXHf/LoDSREJgxwGY+b9tI6BG6uuVYrUswjACAlz7SP
	 d0QhXrjmSpf3Khy/qUoBIrAPSUOyfnyNq/EauvDbdKU4c/8cf69TOxiPG8dsvbR/Gmjhz
	 uH33PIKfqzW5HMJWqSv/o1DTMymxdbDXLbvmH3jLpUMAjOZCGolCRatyl2r2S4ALnCYC6
	 Ed4rZwRQ8m0SOrc12bajtBVRDY8xWfwah6YFW1tzNrjueLYyIYkkIQlHAIH6YAuWQVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795435137;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=B6js7ztezthXpHZzjGx/lwzyYsi8HVANsbsOCwVJ7Sg=;
	b=vzQ6o7uHRaFJdDbDiYYvMPBQRyE6jFTAxjf77j+n3u65EKwoNldMCpD8lXCMMUoqq979
	 DG8QC2SfWyS7herQCTeoRoe9Mnn/cQUdLheKIyQztd64qWNMKB+rD6OCk/B7U9cqU1zcy
	 1pNs8ZLZ1AaCjSrS0DBGg6F8bw+Ia9D0YdZLk6mtwcmBEHtkiVjv5JF39MiVU0WNa4/BM
	 MSrqo8nQOGvhNGmvdRqeaCvV5o/gv+C+TLUhvLtTNI5rbjN+mN4H8rWhHf9ZOtPAwaBYo
	 WJSmRYTnZBjT2I0fy4WDJ0J2fbiT7QYXNaXVYb9AP2tpXqY/BGDQ1+gZytS1YHAMQBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wp5Wl1nA;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42BE606A31E
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 11:58:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E42BE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wp5Wl1nA
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1b3b4944a0eso2153315c88.0
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 03:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795435136; x=1796039936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B6js7ztezthXpHZzjGx/lwzyYsi8HVANsbsOCwVJ7Sg=;
        b=Wp5Wl1nAbKEX4pc8ScCnln7HRc8eAV1I+iQQdUObEK7kVGS2LNTvLVFntembc+eC6x
         QV8/T4jlimHpe99VqM0g/qg0AUBzFg8W0zN+sGjCzf0LNB8Ogvvu1rxz/ouwP98xgk31
         jlL9jxF2rrTpJM51ZR7Xmn9wup2xJ+Z9f8YxEhOBhGxDRKUWnfGTHjeon/csaP7SQJye
         4lSqKjuHgbQhYFNt3GRQDk6yBEjy68Z5BcQfPoK59xrmdiZxqWsIM2XN9usbcRgL2+nP
         Rz/RHTawl581T4Ie4VAhxdKmlsbIqPDz38yVuVeK022p2ZkA7ZMOK19qO1pZ+0w/RptO
         tg/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795435136; x=1796039936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B6js7ztezthXpHZzjGx/lwzyYsi8HVANsbsOCwVJ7Sg=;
        b=CK8hDi2W4sEkC1HaBqaCQ/kTrJ+2PuuNCGDwzaPUHhVvUA9SiHnNogkj3hCgW6KFmJ
         LDpWXbqY8KTULvriCNVlH2rlYxOZ1OT2Ackl527ajvhe5lhpWnsmccYgv5QlR32CdAL1
         +9WCVajt5lhmNrvJ+gIWewTEp9PjZecDWkC2dGLXqzNjH6Pbv4+SEAIwjQ156lenRoiI
         L3tgBNFk17JGceNaQ4PMdFqLTge3LxZh4BzNRdpDTYFQ1pOB3EJ3BX3/QWc3aVvNpOSK
         RN0Lkq3l491sFdnjtkoWshS3Fs/HNqH3DCSnElNgKHzw1fkrRx0Q3ok6bAz/WgKz3Gv0
         wl5Q==
X-Forwarded-Encrypted: i=1; AL+hErEY2cDvn6Zq65MbecOyzSDH2rzMNO3wkr+Aj8eiBmTv28eIkcwroyBf+7fAyeDpGQajoT8Zd0ZBQ4Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hr1z7CXHN83sXLLhjDTr3InEgm6rwKj0xo34+hoFJU8YUn5TF
	KfANYs/J42w7SDZbGsfaVRUGMGJwr3Qxx+JK5BbUDj8Q+5HdDu+KQKEO
X-Gm-Gg: AZFdTZfFAoIs+ZC+Yux2DaQo77t3Pz8P+gqMuxe01IIOdTXGHF6d5Y8iWB4fN69SF4H
	mqLN2D6o5a6Ate5sxhlCNGCjZrCRjEEjaHsoGGH0jyhzhsmxw2EQ7sgJF8anAz8IRGcN0340Dyv
	dGmzHMDroMQZ4GNdDqnsRZveBrHBfbMIyIC3b/TUhA4Pl9DAvHpiHdySwPJpKPseKSsTLsqepE1
	pvms8PkEUhd7AEySkpHNGekbJLGRcGqIvWv+kYtzG6uaRsg2X/NCAHlaUXKpdyMHV4ANByJgTVc
	yGKHeALp92DXZFBj4yjcZs8rVScu+7Nw7MIUE3JjOV1yewNHUWn445tkSHzJ0GES27MoFJPK4/d
	svv1TCkdFTUIdHjQqfIx0aCkduNr3ic2oPBoGknKSbIr35m6dNDVANC0whGeAriQVgZmfm7Ps35
	JYjnyi5HZ7Olj4KMROkYrLyqfoq3q0vkUmKxLEqEM8USFpTs+jtjABd8M5+PFUEHLjQ+3j2GWTx
	3aWFy2UN9GUUlPT1ZcsSgb1E+GtLYqVDtI1hhsfxMdRBZVPrG7ji05HcarAo+kOnWHp7vIRReuR
	+5W90uas/7kn4lbPjnyXe9Sih8WhbZbuk4sWwlqvI5xMkOAuAWqZFbwZ3nQ+g7TJALaB
X-Received: by 2002:a05:701b:4291:10b0:1b3:af3a:e78f with SMTP id a92af1059eb24-1b5568e10ecmr11698042c88.27.1795435135970;
        Mon, 23 Nov 2026 03:58:55 -0800 (PST)
Received: from localhost.localdomain (vmi2317719.contaboserver.net. [84.247.152.64])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55682d301sm27972005c88.10.2026.11.23.03.58.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 03:58:55 -0800 (PST)
From: Lian Wang <lianux.mm@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	damon@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 10/27] Docs/admin-guide/mm/damon/usage: update for report producer sysfs
Date: Mon, 23 Nov 2026 19:58:40 +0800
Message-ID: <20261123115847.8976-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261121210013.130397-11-sj@kernel.org>
References: <20261121210013.130397-1-sj@kernel.org> <20261121210013.130397-11-sj@kernel.org>
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

On Sat, 21 Nov 2026 12:59:54 -0800 SJ Park <sj@kernel.org> wrote:

> Update DAMON usage document for the newly added report producer control
> sysfs files.

Makes sense, so LGTM.

Reviewed-by: Lian Wang <lianux.mm@gmail.com>
