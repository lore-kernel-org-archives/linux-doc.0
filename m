Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CB541D22E
	for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2026 09:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789377562; cv=none; b=Ap+wrnPStAjF0aVJ2HlnR9W2eC/9+vgVew59eRcbc5umqd7fYAmNqzhy5KZRy0X0mbzr1Wji8Ra75P+z2HeCEIW7wHV6cmdwyufYFst6yA8lecw9Z4i+ZY6rppyBWrkrLuLTHcnJb2PBumrrHHW+aDBvq7+4nfIueieG7BYAG1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789377562; c=relaxed/simple;
	bh=vebMstFlzlIio1gi34O686KbXK9pRbjRlGhEAO32We0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jwHcEFGmM9jzGq/6N2Nw0dAbvpH7qRvUrDwLDEZPDDzLuCJH+j6XCf/7HF+3UkYqHbvoFb4JXRWkbIVh2y3mqxNFsPYjdvq2briDRAUl0RKkFuc4K8wTlZkcDKAi9lRyjUP3zmNDfgjIrfaTAVr+2bYVOZj5Ok10MaxizWrqzUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cWjsWwLy; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cWjsWwLy"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b2ad861b1so275793a91.1
        for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2026 02:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789377560; x=1789982360; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uPi+u/FU/duAmWdWXfNF+CL6o9CUHUuEHPhvqxj2P3c=;
        b=cWjsWwLywLkUEZWOspU9n5tfW7uuYGHPGZcgsh8QGUemgY9jzoIk8M9y+bsVY7dokq
         OaL2NdnWpHcak9DfO46LgUg1aRtdMNMqb1X1YbZOG/r8hcvLjOJX26rUAtkCP87tJNly
         98kKj+ovDvff5DjkDFFINaJEkeS/hfmLwFG+GpzVRp4LVQeMrxXaoMdX4kbgCBK24M8Z
         dsBV+xBZZ03DTcuwfHsC3DFN8TAMnd3fKHUCjZwo2D8jTElaDhoqQ3LvMBfC9reBdddD
         5NBpreKvfVolohCLuDdgYqF2Rqw9HaoHCKy+Y5EtHbuSJc+jBYmxYQyMvRO298TH6+Fm
         9LBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789377560; x=1789982360;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uPi+u/FU/duAmWdWXfNF+CL6o9CUHUuEHPhvqxj2P3c=;
        b=rdHNL8QfG+WzV4gENvyl4nWPy7eMsuIru4EI4rzJAA0asPKQe5YvF25jU8/MKLDVxJ
         tcBThTXzFcAzAtb+ttBsP/p6VX+sNH6zlNDOL4IUpzUxhptT+MTZ12mEhGnc2Rav9o1d
         mBIx2Zqvh16vZt/13sr3bsBhISndCYlg8b4f/sKcQqwLIij0f0DlxV5gyIZNDORxOq+y
         ZkpDlTBApZlLY3yR1qw1CB6n2f4ElldAhchdNCtiGQt11IuXix8vY2M1TBK/T8f/A42F
         d70YMCj3PROBSCXatwObuqRFKVhCkqc4SlWFA14akjsJGW1TsugrmcSBFt4+gJqRfhhJ
         EWxw==
X-Forwarded-Encrypted: i=1; AKwUvBz2DJArlI0ZKTqNEFdTn91+/vl2JYC1EKUkMyZKM+VPFKBj8/BsPJBW1x9sj9GzEBNLTD/MEPes2eg=@vger.kernel.org
X-Gm-Message-State: AFuF++mKrnyQ6+sKdaUHS/NsLXXgNuVYkVUR8bhO4HgBm6BnPYMPv+XZ
	zz0vfRCTPbaknn8zs886Ljs/P2KeHlXHOS3OtfiIjoRh8MjTPoIDwD0Mgir8UA6q
X-Gm-Gg: AYBFou1Jl1KFjFPvVwcqoldQCwFKf6bb8wwwiMHLulbllpf9dDWlzGut8UKAyGor1HI
	ZcsOaauUzdH4fWkaIqn0GkiMXHmpWafxtEolvmkFln4OA2N1acEuODe46i9pYYoqwHd6E4VTjrz
	2CAmCdJ7ei6MPtQjhrvr+s/69/a8Jd+Cklg3wGVzfJGM4rBVl6qd8U/Xo/e4szjPpyfr7hY858M
	1cMpFrI0QqgQRn43w9H7Tg93+YqGKFA95ct8L9tPn72DRDTDhG/70W93n79Uu3XcgbaeG0awqW6
	FOFO5Fs3PDbKewyZVEKLV/fVnMKi7pLMZqGkleyQjoSWkVdkZkfJiac/i03cFlBXTozDfpPMHOT
	mxrqTRDNSGjfu0rdyfDeucizdKtyBLxbZtDgJvrUFzZiH0K8DsHTbzYj+0ul2dzAbIs2Wo0bgzR
	dqav6x6kLhQh23qHNxOa4AYL2GC/cWHLX9kCY5bncpbvy8gUwEOI4PPUJSt8zYhsL+Axlu6Ox/A
	H6Udvf+
X-Received: by 2002:a17:90b:55cf:b0:38e:480b:99a5 with SMTP id 98e67ed59e1d1-39debfb1b55mr2624087a91.2.1789377559685;
        Mon, 14 Sep 2026 02:19:19 -0700 (PDT)
Received: from elitemini ([2400:4050:d860:9700:75bf:9e2e:8ac9:3001])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d95095946sm20461974a91.5.2026.09.14.02.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:19:19 -0700 (PDT)
Date: Mon, 14 Sep 2026 18:19:15 +0900
From: Masaharu Noguchi <nogunix@gmail.com>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Chen Miao <chenmiao.ku@gmail.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] docs: sphinx-pre-install: warn about unsupported
 Docutils versions
Message-ID: <aqe7sWNitaPYaUYc@elitemini>
References: <20260913-docs-sphinx-pre-install-docutils-v1-1-d923c769af91@gmail.com>
 <53fbb5e6-70c3-49cd-96a3-3477f048eebc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53fbb5e6-70c3-49cd-96a3-3477f048eebc@gmail.com>

Hi Akira,

Thank you for the review, and for the pointer to #3099.

On Mon, 14 Sep 2026 13:56:16 +0900, Akira Yokosawa wrote:
>> Sphinx gained Docutils 0.22 support in 9.0.0
>
> This is not the case.  It was done in Sphinx 9.1.0.

You are right about what matters here.  9.0.0 was announced as the release
with Docutils 0.22 support, but the LaTeX size limit that actually breaks
these builds is #3099, which was not fixed until 9.1.0 -- so the boundary
has to be 9.1.0, and v1's check skips the whole 9.0.x series.  I have since
built those, and they fail:

	sphinx   docutils   core-api   admin-guide
	------------------------------------------
	8.2.3    0.22.4     FAILS      FAILS
	9.0.0    0.22.4     FAILS      FAILS
	9.0.4    0.22.4     FAILS      FAILS
	9.1.0    0.22.4     ok         ok

Worth noting that the 9.0.x rows are not distro-patched: 9.0.0 through 9.0.4
declare "docutils>=0.20,<0.23" themselves, so a plain "pip install
sphinx==9.0.4" pulls Docutils 0.22.4 on its own.  So the pairing is reachable
without any distribution relaxing anything.

> Fedora 45 will come with Sphinx 9.1.0.

I tested that pairing before replying, and you are right: Sphinx 9.1.0 with
Docutils 0.23, which is what F45 and rawhide ship, builds both books cleanly
here -- core-api at 1215 pages, admin-guide at 3074, no errors.  So F45 is
fine.

I will fix the constant either way.

Thanks,
Masaharu
