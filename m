Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794175628;
	b=xeqO01RowND++wboN2UL7BlakJoh7cZFkT3ZCbRtRJLO8ubRPNBkSshDncg6nGfeCzBm
	 htgNX0X594DTjpfojQm9ra4cbZXlmmEZj/vUsVtAmIK6QOtEyh44zkw8bWr4kgUsydb8Q
	 mjJjO2eAyplL5tB0TywKhMxNqPsIn+mGbIB5kt6MxiiFST2BjGm350l8t8OSv8IbM3v5r
	 7kpWVn7vl6Ty9oES+Y+uzIEYF7p6HnT363qv7UNCzjvRtYC6R9O2EmRyGzUOFvA+WYAev
	 J9oAy38w9JOV/43c3kuLJrRfdU+aLk+ERhWNTW8r/FSxOFS0XwpoXtbgkNSfeIdvUWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794175628;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:In-Reply-To:References:Date:Message-ID:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=fskAnZVKzc8hUGA1+pTPLWvHFMaE6t+Q83bw3SAfWr4=;
	b=YyYhj9pXVI+knBdTtxJmfpRaGysc0s/z80QAE+pPb1e1uZcJiBkjGWv3EXQIdZyzthnj
	 H18TapTgOmwEmvrmnf+BM1n8eNVFN8lEtglQr+fu4NaFSBm9p8ueQaClwfwvLX5f1940F
	 ZBPCxEOr0lO2W/isB6k5xrLgbJDGltLDUcmJpgk1Sw6pYYkv3MBBgaC65JpVO545bfWAX
	 n25U9jVxR1xbveFdAWqqaOeWIxSjB5stuZEnxpFaLsdRA3Afqfx5OojTpEhj9pePJeA0i
	 3RFKZSkHIEg3izB0dDeuHNSj2o0dkOHoAF+IdwFjMgdleIXE8M8mBg/Vspk1lsO+AbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DMkSfkrI;
	arc=none smtp.remote-ip=209.85.222.173
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85099606A320
	for <linux-doc@vger.kernel.org>; Sun,  8 Nov 2026 22:07:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85099606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DMkSfkrI
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-93f3c895a0eso23355385a.2
        for <linux-doc@vger.kernel.org>; Sun, 08 Nov 2026 14:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794175627; x=1794780427; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fskAnZVKzc8hUGA1+pTPLWvHFMaE6t+Q83bw3SAfWr4=;
        b=DMkSfkrIvh1J0HmyqnldyergtJCpVvzbM5wCx8OJ2o23lhtd7XoP/mungBoCmsSuqV
         M+rYApkY8E0axtbaa8c13yvk09njje6q4WLdVpJlBRrKUkSiA5bVzZwBO1ycKC4sqJIB
         R+Nkm8BWTmhQ1/h+bNlpkJ0sR92QwIqusM2bsN8SVZr+JR1VvGLQqBKIdo5z1FOoj/OM
         abdkoH7n1mm4fwCKsW85apwhJYw/e2R3cVgrjcPJxPubj9JnXKEZ427TWvB9z3Pc3D6z
         6V7XaK1/XyDyfSxMPSZ5S1XB3652vVtep5CjHsJygTDjnHK8tdBGZOY0VaHvLr8eor7U
         iBHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794175627; x=1794780427;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fskAnZVKzc8hUGA1+pTPLWvHFMaE6t+Q83bw3SAfWr4=;
        b=NoKF5Elpkto1T61oujRiQcOFFtFpkhGFYeeg/R5njwEuSWbaNQbgrpF8o2Td2p/22Q
         fq5L3YpjZWCogEqqjhZzs7JgWNBDCNWckXwrqoz1p83ApMvQCZJK6z32q3hEwLnTOVIq
         OWrnNVuUOT3mP5C43AKIz68TKYf/FT3Gc6NueGwSnwlFyp5uynsjJZ3XiHtLiXqy/ZAu
         q+LqDMTJYKnSBCp3ed1Ei2ks4XiuRR/5dZn6wjKNkethkRB1O6wKwVXWMozuhWV8r04G
         QBebqXCsFF0Q152WQq6WSfQP5NhQZe3gAMw2DE1SOppJgGTySn37HJ+W7NiAZkRfXljl
         Kf8g==
X-Forwarded-Encrypted: i=1; AL+hErGP//JvDlkC98gOBAjp1QEEd8whXjmql5iFFrcwnA079uZPrsrra6+dpknFVz/udWOHMwjwqF5KM2I=@vger.kernel.org
X-Gm-Message-State: APuU4Z9XpNK8ymVlILzGUqAyvZvlS4AvjUNBA+9DwdNxhwbGMK/VEPnJ
	HiTQNd/aMNi3wNU82DENV43NY7OBnmjX3nKcfqaeDd/2MC//PWkyNkE=
X-Gm-Gg: AYBFou3dZul6Xsy6nPzE8zedGOI92XQ6h9OR/Uhu4H7ouV6D3Z2/YrR1mxX/YrdHBTb
	dTLBHjzrQXLk0HrGBYc+L74pXxC9fa/Hv8cV294Gltm/HrJO3PYf5Vzu0Y9JMiT+RvnWLFvMOYA
	BmEVL1K95Bzda8PGpXut0qSi2yQC4mdhqJERWLR9AJCknCzG9L0cyp5uwths7aP2ttDABngizNr
	Cx/9C3SmOXcQpGbg+bO7LUAvjtX9glzRSLTl+KxZHybUZiuJilULZVwTjKBc4Tdj53RMd0po29C
	jqr0uAY3KWORn1ULTUoWVm2Jh+8GbnPX9i1HpxNkWPTtSwFZD2ISi0YKod6cQOfuoFqGrSPWRgD
	Kj+fJvpIoxKQG9TdmhMKNKdgvFulUXnGXWrA50jw3Gdc4itEH2XcWMPnPK25Jge06seqPdBzPxB
	SSaQ/cfJjKxv5uod97WaU+TCgYcrLBe1ldnOUwyqmUs0jrSk1iEtvwtdxOdFy7eJ/Abr38B9nVU
	WBQePTPYX0RAPoAZybFCqBctL1ny4QtZX9z/dZb3o0oQLDAzxkuQrcjoy5AtL5M8Aw+wg6r5ifU
	kHXOT31ZGoeAVRMX6v+M4CgFdGADm1fsowHDwuqRvZbPGm1w+o2LlHxXBNcl/Fs5Kp4LeomcRwx
	/IMKfKtkaJEKkn8x88t3Ra51ZfkHAXG7d3WT3FMRiG4QSUM1XBg92geQkl2SnF2cvZ4+s2BA=
X-Received: by 2002:a05:620a:1a03:b0:93e:3824:4123 with SMTP id af79cd13be357-947848e90admr386631985a.65.1794175627456;
        Sun, 08 Nov 2026 14:07:07 -0800 (PST)
Received: from [127.0.1.1] (207-237-119-98.s2383.c3-0.nyr-cbr1.nyr.ny.cable.rcncustomer.com. [207.237.119.98])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94782d93650sm306944185a.23.2026.11.08.14.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 14:07:06 -0800 (PST)
From: Eugenio Zuccarelli <eugenio.zuccarelli@gmail.com>
To: linux-kselftest@vger.kernel.org, workflows@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Documentation: kunit: document --summary and --failed options
In-Reply-To: <179297820302.2598507.5712076951623488183@gmail.com>
References: <179250646543.2190262.8632957027583518623@gmail.com> <CAMAsx6cniehFSgKz0+FRbGV=A=TGvogwx87xcqhiZNQGfeFFYQ@mail.gmail.com> <179297820302.2598507.5712076951623488183@gmail.com>
Date: Sun, 08 Nov 2026 22:07:05 +0000
Message-ID: <179417562518.1641291.6757389780804092916@gmail.com>
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

Hi David, Brendan,

Gentle ping on this v2, which has Daniel's Reviewed-by. Is it okay to
pick up for the kunit tree, or is there anything you would like changed?

Thanks,
Eugenio
