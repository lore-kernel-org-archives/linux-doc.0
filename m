Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795458406;
	b=FKk15hkiC6Q30nTMFJnjbHwPLWOa2O0NnSAlb/LoCIpUy9qGJl5mT2FCNqvH11Ev8SoR
	 jBQx487K4jaQ1HPM3SPCPVeeG2suPeWtRldNkGYdvILDA8QYTsPFBoyqwlJbvk47ETq3R
	 Fkebem1A8idCVK0qf+O3uAMK5d6QK+pi9imuh+/5ZO/aEKUoKetkx+UsUdn0LZYJYAA0E
	 xZxPzx4vX3Lky+5VWpLClboxmXcEEkVDKstWe0lYjPluoL8cvjbNAhNSGdA2PhLurh9m+
	 6m9OPOywbgnPeVluxp6yKKKIgzszsydAh7BsLBd/zlWLL95/XWfn78wD1oyJWUC98uA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795458406;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=thHuqHmooBy0uGsMcFJyj79jvgcNxfQof3z9Kg8ZrOQ=;
	b=EjCS4+P0jWfhf6ioHjCVgOjwn2CGgddxLgfok+IJcJMdtEQ7ikc6HysOeR+3Jyg/VdtT
	 ZTwkAEJADupViIFQlLwli+HRWNlTAKgyBpELUoJwFxAeJmdbR6ymUU9kyw6Bf89+0+9cC
	 S+jpxdXHIYesFHMvQCcYtDXKd7tJ0rA02XBM4jk/uUSvnpqs1IVCZCf1FUI5ozEt9uKxz
	 AKtIrgEGEroJs172xRFZSRsyoLNOuR6ltQ2mO8KVB7Y7mbUsgAOYQzIKuvOL5vEnP/5Gz
	 IvZ1siboFiRpzYPDjQdaEBZUU7E/fkk5AwRjBfoP/SnTik5siEy7G5dOWMPTVbX5E7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=A3CgtlLr;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA0F606A31A
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 18:26:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DA0F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=A3CgtlLr
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2f03920c4a0so22946415ad.3
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 10:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795458405; x=1796063205; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=thHuqHmooBy0uGsMcFJyj79jvgcNxfQof3z9Kg8ZrOQ=;
        b=A3CgtlLrKMI/0wVqoxsYUWu7YEQMcNCo/SoU3XWimCZPRdYmKz6jWB6VbK0N6DGBBM
         MW7LmbyTpBgl2XThw5/fstI6W2Rv8yxc8XG6zYPxg8ZUYNgt7MS7vAQllENT/gWjOUBc
         NUkjtO73p0y06ZchiOAZBKAR0NmkPfAZ6BoVw3kxcoF87eYmiV6YGN66uIH8j6wfugKg
         0wyCXn4iAws+ZGfFmw0hBfPhM+9JsHWjG06N/zgoRM0KEilK/p8WhkB05sKl9EAl2foW
         SywtFBvUlcMwn3rMobIEFlmuLLCTcKNE8Ny1fFBkV6/ZuuPqunA9lD9YpmKegCnNI+19
         A6Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795458405; x=1796063205;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=thHuqHmooBy0uGsMcFJyj79jvgcNxfQof3z9Kg8ZrOQ=;
        b=oBnIzHD2V+v/FXB6maw6pxhpwjltMBol/kqweNqBeNFpZFw1SHtb65yc1Em5+cWA6G
         2FsHmtcjmCdV8+JndL4+M233lViEZHL/CDM3j17SeBY4si0yVByhfrvqPqJEhXTsq0gJ
         34W1tOx93oFVBpsPnhbEGoWPU6QTxfK1YGjsBaBfibC07muj2DZ1zz8r23s69yTP4Vpc
         OV9Qak0kOy8ZFpv78cLw6o7G2e0hrwiPWQI9CnBjcf9W6JVDSBZ9dPFqzw0toYLcYz3F
         5DfFj3hIhiwci6Pk6CaNxcnNBru152WRqHKHLWGV8pt7k4oK6NSbYfRhghXBsdrbo3xS
         h4Xw==
X-Forwarded-Encrypted: i=1; AL+hErFzHbgEu8amFqxdhlkYpDj8vTvD437431blt8ANf8lQAa0dC1++9N6bDSu0xzAe0EXRINw+DuGReV8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yWlBY6uUBRqrzFCiJx9ycIhnZwGCzu0kAlNPfTuNohceKcNcD
	2WZXI3vBzYRVYAgWPEj1pvyeBboNj4TzB+fn8/QsGo5HhYg5oXrU3pb0casuJ4q36g==
X-Gm-Gg: AZFdTZdVsQdOvDvcnmOMdWUdE7rnj9E6uaDdRPsEwE+l8CicSyiGY1MWsZlKKHl2OwX
	/4X0lDG5JmWmWoXywJIbKjTvIAVdIdAp5CdHUx8CsJDT8sEj278VWFMj3pd1c7ReHNp7KbIvwi7
	K+XT4+PyxlwVOC9K2AqIvPqls6wKIeW+EioiPSDZHkMbTWUv8ZMf8cAQPKKDtHwAKghssXQiHyS
	A2rppylOhe9CI0cDuQe4kOQhIN+tv30V2Fh9ib4pVXllji+jngz1sh7A0edwB8ZjwsCStBJ2uaF
	uOz+LHZaVK9ivX8gFhwGWXvw3Eg1LOK+FYQU7vN0ZUVNJIOyBmUg99bYIGwSnDRc5NXmlUbetuO
	/AWAFjeSNx+aT/zt3i5GDFsTBIEU0FI/eMHEm7FOjU/pPr8DyxRWJEvH168NYeo8ZF96NFktfp9
	gBdfIEjsI1SmnOmyBl1KoufdosfmAS0JmODyeCOaGqD2U9lQXyWjN8V+YwqiqDoBYBrKy9/r6mC
	C0+46VJ0HrOouslEI8GGLSgzZ0VUbyZxmQa+XmO4NOCPhTMMLbvWF7+wulLcb4675chbjnmhiAW
	WTR88EDDD50M9YN4Swg5yOBI85sBzKd9VBqfxFc0DgPoyRVQJ4UXzU0R7jL8ys2Iew==
X-Received: by 2002:a17:902:d542:b0:2e9:6790:212c with SMTP id d9443c01a7336-2f03f190776mr120496345ad.30.1795458405057;
        Mon, 23 Nov 2026 10:26:45 -0800 (PST)
Received: from localhost (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f120282sm56755105ad.59.2026.11.23.10.26.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 10:26:44 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 10:26:43 -0800
Message-Id: <DN2SVVWX66U1.37JRVKARDRNYN@google.com>
Cc: <kexec@lists.infradead.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-mm@kvack.org>, "Alexander Graf" <graf@amazon.com>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Baolin Wang" <baolin.wang@linux.alibaba.com>,
 "Christian Brauner" <brauner@kernel.org>, "David Hildenbrand"
 <david@kernel.org>, "Hugh Dickins" <hughd@google.com>, "Jonathan Corbet"
 <corbet@lwn.net>, "Liam R. Howlett" <liam@infradead.org>, "Lorenzo Stoakes"
 <ljs@kernel.org>, "Michal Hocko" <mhocko@suse.com>, "Mike Rapoport"
 <rppt@kernel.org>, "Pasha Tatashin" <pasha.tatashin@soleen.com>, "Randy
 Dunlap" <rdunlap@infradead.org>, "Samiullah Khawaja" <skhawaja@google.com>,
 "Shuah Khan" <skhan@linuxfoundation.org>, "Suren Baghdasaryan"
 <surenb@google.com>, "Vlastimil Babka" <vbabka@kernel.org>
Subject: Re: [PATCH v4 14/19] selftests/liveupdate: Test which tmpfs files
 can be preserved
From: "David Matlack" <dmatlack@google.com>
To: "Pratyush Yadav" <pratyush@kernel.org>, "David Matlack"
 <dmatlack@google.com>
X-Mailer: aerc 0.21.0
References: <20261111002358.1842967-1-dmatlack@google.com>
 <20261111002358.1842967-15-dmatlack@google.com>
 <2vxzh5hb1sqo.fsf@kernel.org>
In-Reply-To: <2vxzh5hb1sqo.fsf@kernel.org>

On Fri Nov 20, 2026 at 6:29 AM PST, Pratyush Yadav wrote:
> On Wed, Nov 11 2026, David Matlack wrote:
[...]
>> +TEST_F(preserve_tmpfs, frozen_size)
>
> Nit: This test isn't really for "frozen size", it makes sure a preserved
> file behaves as we expect it to. So perhaps call it "preserved_ops" and
> update the comment?

Will do.

>> +	EXPECT_EQ(ftruncate(fd, page_size), -1);
>> +	EXPECT_EQ(errno, EPERM);
>> +	EXPECT_EQ(ftruncate(fd, 4 * page_size), -1);
>> +	EXPECT_EQ(errno, EPERM);
>> +	EXPECT_EQ(fallocate(fd, 0, 0, 4 * page_size), -1);
>> +	EXPECT_EQ(errno, EPERM);
>> +	EXPECT_EQ(fallocate(fd, FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE, 0,
>> +			    page_size), -1);
>> +	EXPECT_EQ(errno, EPERM);
>> +	EXPECT_EQ(pwrite(fd, "x", 1, 2 * page_size), -1);
>> +	EXPECT_EQ(errno, EPERM);
>
> Nit: Is there any point in matching the exact error code? Wouldn't
> checking for a failed syscall be enough?

The documentation that patch 11 adds to shmem_luo.c says these fail
with -EPERM, so I'd like the test to check that. But you have a point
for the other tests in this patch: the documentation only states the
permission rules for preserving a file, not the error codes, so in v5
those tests will just check that preserving fails.
