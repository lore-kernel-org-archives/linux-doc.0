Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F4F17557E
	for <linux-doc@vger.kernel.org>; Mon,  7 Sep 2026 04:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788755981; cv=none; b=WB3C0KrLvvOofpR2xilWvgcedsuUi+UMgkMaKEkKeL9syxlxApGsNJ5hyrOcfURVhCQ/SPUTd3LIB3r99SUiALX83UDeM89jmB3HJznLG/DASPPMh+kvv7LGKL11OecXfgTisOVzRPTWGhC1D1H3kHUVxi/R7a3ePgOySVm9Ev8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788755981; c=relaxed/simple;
	bh=8WdEEp8LwljNNF68spCvjMrVMLTyjpQ4kBkfOIub2EY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aOjmTR0oBygAsyy5vNpZmFCH/RJkkWNqFKlYIr0xwQv/SoS/GRl1Wp+zIO90X2nTKCxeN8FAU2CeZ0ddwynvgJ8tBaq9d+mwX89zFI1MyZSFjveT5cdL14Ymr4V2Xslx2M5T1JZx/h/fF8oLc8hpYqwaWkmKrkMrbVjJ/8TIpfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HpIBtZbI; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HpIBtZbI"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d7200b2e15so32093745ad.3
        for <linux-doc@vger.kernel.org>; Sun, 06 Sep 2026 21:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788755979; x=1789360779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TzKR6aE4Voge0yCJJx2kSjMA/ao6SFaxegmFhjmqeFA=;
        b=HpIBtZbIBzQBTcpNgwqNhLjvYyGxPclDU2n8+yqunEkLPm6R4Hsq+T2e8YZ1Lqa1tH
         L0PYBf4agnm4aoWFYOIMOQu68PIwSVRnsiMX/DB/LQvgHj5Vhbigd2zfG+0nzFwtt0p4
         9t3M/1XOZep5jaalV2fU26NWudY/l0cJblTOTqJoRiT0ipZlVBqkrce4SIlAetLXixmF
         eSZbhOo2YeLhR/9HfgRnSCPjlLsBE2v/WiRHD2QH2LA0eQjW/RxI1XdhL6GbWXz0I73M
         Diw4UIFCZVMuDN2p/NPHI4iSslfRD/aF99qo3I8E/oF6/BDGC1eZVsPkzG+woMbaZAUs
         otWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788755979; x=1789360779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TzKR6aE4Voge0yCJJx2kSjMA/ao6SFaxegmFhjmqeFA=;
        b=EAfw6uKLAMV5IYZaIa4awzjhBAxECZKnxIsyda5xu1iAUhGLBxcs906DZ2br4mMUAY
         OnKG3Et0RN01Ui5H71sMmhxpzczJh+TM8qyYTFNPR6TvwZiKMRehyq+Xw68uBC2OS41H
         IK7Z/RDYdRgiN24ggj7nYL6IjCnjHGRlb1TI86WGd2c/TT1By635pzlPXUJbGrR4myi3
         LDzHAPbyee7tB+g3tKxrqIZEgrVM81OMnxaQPaCdISl8RYaMf2aAqSjLoTS8mMKdmY4T
         jjeXFAygnPABoue9JY5NHjYOhRIw8eZsefumWNBFYDejakXVavkbBAXQujWQTDser9J3
         Vo4g==
X-Forwarded-Encrypted: i=1; AKwUvByjZ/+ZR/CTOhmyngtXCmXLaDr0Ul9DKxkbufbcvTbj5l0DImVsM2Diy5yenryQnwBzBdgUWEEaj2Q=@vger.kernel.org
X-Gm-Message-State: AFuF++kN7iulYRY0zkRhiMFDTbgmesiv4kVAi1BbZGHNrXf/kKpVfWRP
	0A2+CcJlJQaV72uGPW5uWA6QjynCpvaM+FXwNz5i6uEyyapnFQMyFf0l
X-Gm-Gg: AYBFou0RmAV1QZN1yWpC7Ch9GclCd0HM9kjAl0fWAz5rSPbC8oWiQvopdkw/9lasLD3
	lrBxlgNAEdj6PBs00Knznx9rHcC0AP5+L9xk0tHMhir9rUXXN7wQ6KZkk1fpvqDKYcyRQ1I0F2i
	903omM9/67EaZiJhQwLGcPC6550ASTMjI7nHEPZsajy7UOcTVes4SJIzidwNKnTehrbiB8Y/bgt
	y+Cb56NNwDqYwevFMBAP753jnpQuZMxwSZ9n9RJHQA4xKaxg6V64l9PmEXxZh2gUFQ0xWOqnVYu
	xPNzgZKKUYfnIKcfMGIpDNERrlmNlgMwyb6cnAC5vpkKPgvANFjGug9OFRbaIu+lDYx536ZjcPH
	w9oLPAsXXcHKTwrtLtjr95ooBzGPtvGkskJsNm4yQJte3AV6XOKQTHdL3qUOdJ3XjPtCN5I1osR
	iSBHN89ojwcvZvvZCIyEC9/oNhF928yDvDAVVqpEN/PjwDjSLzkR3gCyWMqYdFhQQC9qSQByapJ
	u6frTRDI/NRSUizjCPjfv2y
X-Received: by 2002:a17:90b:2687:b0:395:4290:46e0 with SMTP id 98e67ed59e1d1-39b2609f768mr35245332a91.5.1788755979238;
        Sun, 06 Sep 2026 21:39:39 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b123731sm22649867eec.18.2026.09.06.21.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:39:38 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/4] Documentation/arch: fix typo "initalised" in comment
Date: Mon,  7 Sep 2026 10:09:30 +0530
Message-ID: <20260907043933.33452-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <b7b77956-591f-4282-aaad-04c9f7899413@infradead.org>
References: <b7b77956-591f-4282-aaad-04c9f7899413@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks for the pointer, and you are right to raise it - I checked and this
patch does fall foul of that rule.

The word in Documentation/arch/arm64/booting.rst is "zero-initalised", and
I changed it to "zero-initialized", which quietly moves the file from
British to American spelling.  The minimal fix is "zero-initialised".

I followed checkpatch here, and checkpatch is following the dictionary:

  scripts/spelling.txt:875:initalised||initialized
  scripts/spelling.txt:874:initalise||initialize

Those are the only two entries in the file that map a British form to an
American one, and by the rule you quoted they should read

  initalise||initialise
  initalised||initialised

so that the misspelling is corrected without changing the variety of
English in the file.  arch/arm64 currently has 58 uses of "initialised"
against 132 of "initialized", so both spellings are clearly in use there.

I will send a v2 that uses "zero-initialised".  Would a separate patch
fixing those two spelling.txt entries be welcome, or is that better left
alone?
