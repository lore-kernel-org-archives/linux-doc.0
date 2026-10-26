Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793030027;
	b=RqMeUSxrJFsXBeY25xkZxTuatye5cp1De7OtW8y4ysuCWuR9cEWwecKgdpNjrNTwxPX6
	 3XGWtWV7UunwpW2A1ACwtfil5HfaT64iY4YX1jr3AhKM8RL2VwWTOha73HO0OaiFSBLkI
	 GykZDDnt0Egc7nVF94irQbTwfhio9/HLA4CJZoL/H1acV0xokwK3RXqkO4Nli1j5FYJ2i
	 B50ECbeoFWn+jjOLCRPoHIYRBbin/sPB12wVgif/M1+R8NCzhu+6ZmbcrWk+ZX/L3GtVM
	 J1iFHHVgHxUx0KZbHteXJGeG/gasrqEnvyS7hOLuuk/GWKITURqenH/P7QENYMW6OZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793030027;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:Date:Message-ID;
	bh=R9AlT6hvjH3cYXCRXYi2r0iIos0zgRK9lv/Md13+/KU=;
	b=fJsOCCJeR9UT//IIPje7pO/axoWerSCP4GZRvUwRMZb/eFNf1LrHpSullvX02CrFl0pu
	 SDfiweG+2x8L591wALyZK29mAfB+AaU7gpFp4qKXNzQIRVmGrJeD4iild6BscN1tjQBd+
	 xuHsPUTsj2kFmkpmKzJZpDD28YK8YkHzt5x02Wejxwjj2zEERSoyl2L53DNsm22VwWelg
	 nrZP0C70azi7Rihct/dFMV8Q0C2+tb4J8Jy4Yo7Yy754OVtXQLzgyEIcI7EEuIzqy44Au
	 suOf6McFe3I4SPtmjuIaXoW1u5TyxmRF0Sw1zN2xecg6BZCq8qAr/HpdpYYiUpfjamA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=holW+jG6;
	arc=none smtp.remote-ip=74.125.227.139
Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B19606A326
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 15:53:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81B19606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=holW+jG6
Received: by mail-pj2-f11.google.com with SMTP id d9443c01a7336-2ea993271f2so10684195ad.0
        for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 08:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793030022; x=1793634822; darn=vger.kernel.org;
        h=message-id:date:mime-version:content-transfer-encoding:content-type
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R9AlT6hvjH3cYXCRXYi2r0iIos0zgRK9lv/Md13+/KU=;
        b=holW+jG6+ZboRMGiQhcKbE08H3dPck1XmGAgKBpe6s1G8r8sMIjy42HOE3uMMff23A
         jK8YJDCosYXY5+ubOy+3LfM0VqteOH6pT9GbaPbyMQy7XKrest65oim060RXgS6At6pJ
         BTFZKpItcMAGCOOJQKjar15mwI6VFQoXInWIsSKYhnXWI37cA/n3B1WbWP5DMzBZUSOa
         Mpt5sTvH3KcHtraQrdtHd7oJEkgOfsaMzDefg+rkuo5Qhq4BmdVHPgEzOHxtxYldRUTG
         TXAdV+4P9wFXUVBnrygdLRHe7VztNeZBjShizkLlCGZ3A3cwrU9xOa7IId7CkrNhltME
         eizQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793030022; x=1793634822;
        h=message-id:date:mime-version:content-transfer-encoding:content-type
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R9AlT6hvjH3cYXCRXYi2r0iIos0zgRK9lv/Md13+/KU=;
        b=BRdh94XBuYg6Udwo50/81erUnApTMIO72D/9SUZrg6saK0rb4jbLmT/GsNJkJ+NIfT
         W0yIDaWOjnysEfypeq2dND+nbLwBgCObcC+vfz7OxqRQTZ2nnHY5k5j2hka+7U+2s+70
         0fagYF8HUV4YZqu84sLXmyceyEBdGX6wOYKDS/gWFLLUZqd26MKRbDo50VOsai2N1Xkl
         iC3szDOWSjmtXWEb4ObYcllDcdb8LKBcyclVOh0IxKeYPwIv+G0yqCnqkLg+bmVRsQ7G
         1e1quxBlMdBL9Zc0RUcRPCMlD7QmdPnvak+qvZGK7pLLSAIJuvA8VSwMrzpmTxFl2G6l
         qBpg==
X-Forwarded-Encrypted: i=1; AKwUvBw5jJG1uTG+MosvfZcA8rhipReDz8WhkIK27twu3r4XCqksQIakrGAA3welI8AFVZo+n+11e49T3yQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKyJmTzJXD6HtCZOgTXtkCE9DfMf8JBbHdNUtmjTawYjtHVt0lL
	7OboS/mmVduzT0eiHcjSj4Q8VN7HUH/W7K/HCaJ914EGTtjGE1zJDxZx
X-Gm-Gg: AYBFou2KvgNSBF98o6SV0OBHgpNPbNSPSZnPzendwCj4o0UXFefWm61l5LFhmV45roO
	kF1ANQ+9x+J32fU0DpDdZjB8TobZqhJZnOwDVwR9COxhDzB/xogD0MvryPMXZ+tZEehuQzQ+uhH
	OoFOFyid5xjVJq4gxABg1p7jvjVKAPhHWqxbBRaS/5y1C13dsax0ytVSvks7/L7BS8fLxHo1u2t
	qHmYzZOVUVqgD2ecLYqgPsgMmK0NInNszM7ajeY/+4wr+Z76GX/vKNPfroPNHMMhXWcdhKLfCJz
	pQZf5LwNfOjs195JR+mYCD7mqL014AWQaxALU+1dEHEZJKQ3vWgFssxHRUGUCdzQwWcgnz76d7Y
	4T0ss67TPpG6xRR1sroSXY/I68rgcm2YiR1iZSpYAVOF9NY0QM0l1NkaR6Teby+uTTWjK9feX7e
	VImbzMqYfG0212jPCIqmxKVFVMpImWimt3IMtJAVSsvc54Sqr4SbLuMAuafWrpq2VHav2yTK3z1
	MRaHVUcwyI9QckPNrqsi+UT1+5zkG6kSXs1PszKhowgPGKR8SBt9OU/yA5LqPR7ylvLTbVD25AL
	d0K9gw/tf8e/iZbahNrG2ratHrJ8YcY94J0BGzQjrd63voCAATArELzBokHWo92lifV7e9JaJw=
	=
X-Received: by 2002:a17:902:ecc9:b0:2e6:c39:b25b with SMTP id d9443c01a7336-2ea9c6c835cmr57333975ad.14.1793030021722;
        Mon, 26 Oct 2026 08:53:41 -0700 (PDT)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b120095sm19328195ad.16.2026.10.26.08.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 08:53:41 -0700 (PDT)
From: Aveline Noir <jm5905938@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 damon@lists.linux.dev, linux-mm@kvack.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/8] Docs/admin-guide/mm/damon/stat: fix pronoun agreement
In-Reply-To: <20261026143109.150059-1-sj@kernel.org>
References: <203ef50d11ae600ab06546d73a2290f291381551.camel@mailbox.org>
 <20261026143109.150059-1-sj@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Tue, 27 Oct 2026 02:50:54 +1100
Message-ID: <179302985414.2.4645643321689632441.damon-docs-reply-02-stat@gmail.com>

Hi SJ and Manuel,

On Mon, 26 Oct 2026 07:31:07 -0700, SJ Park wrote:

> Thanks.  Unless Aveline objects or add this part to the next revision of
> this patch, I will add this  when I apply this patch to damon/next.

Using "to" reads better to me too. Please fold Manuel's change in when
applying :)

Thanks for the reviews,
Aveline Noir
