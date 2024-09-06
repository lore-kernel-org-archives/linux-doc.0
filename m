Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859F8158A30
	for <linux-doc@vger.kernel.org>; Fri,  6 Sep 2024 23:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725666408; cv=none; b=YhFUSXtUFEMajsduKfArA2bsHSJ3XSgBcQmlqi42jji0mFevB4Ho07W+xJkozThetygxL4NprVXw6dK95jnx1NVW1HaF9no3S5LAayKTHeXHJrs+wF6NntN9HmhPFYkermHrPt1sbK6PdhJ+HTkBcq+zOtDXOX1L4Vdx2/GKrgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725666408; c=relaxed/simple;
	bh=xORpeJgI5LmmA2wG/XoLItQq7hgzv1HAbWfy7t0uGCQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TZ/ToURDAI0VXp73vn72LWrZcVFixnQ9JomWzD8P0EOFWJ9HnKCJOQ4DAMdBJYRK3LqtAu6xY5PMU3EeBKpefeUzR4r5ovFqBQzKerqHnMSvr59E4kkzspcVTv9/i33o3/bqufbleYiY8seF0gCXHBOoHRXxkBq5s2ckyQ1UDsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AkqMHadL; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AkqMHadL"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-70cec4aa1e4so1853648b3a.1
        for <linux-doc@vger.kernel.org>; Fri, 06 Sep 2024 16:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725666407; x=1726271207; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DmvpycqcqgqxgFSfihDwn/Zsab4nGMMMjQBDZVpFgUk=;
        b=AkqMHadLKU7H46iRNUFfGx3M9zUvY+AXOX4wolpmObPLCnlw2cnzvKUBaFPWeU2iBF
         L9skC1IIsPR6uzujy5/2dQXBDQxThWJmfJjDmM2ZoRCQ38RVsBtFUReiipdXnoG7Lo5r
         gyK7Vw8Q6CHt1FCYL9Yf57yh8KTonA5YMnP138sFsgU7zp6aLWWfDfbNkqFqB3QBbn8c
         sVjjw5lmt294H5CYNmXadONbREmU+aRzyOXjg240PQjU46bSxCix46Pba3vh7Z2XgC9e
         /kByi8104WZLdjleYMJzShq/Ck48dlJ/z9VkEZF5hYXfMGCp6TXKXsmGPGOIL7SHD2OB
         kvqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725666407; x=1726271207;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DmvpycqcqgqxgFSfihDwn/Zsab4nGMMMjQBDZVpFgUk=;
        b=OLwr97cJDSII7W2FNXrIi8vihhSOOuiztkZIJdEa/0NeyWfbYZ1pDAPAtSnMzbSyPx
         YZ5t5AVwbNBEGaJ9NN97Nhmow2LID9dV6z+FVscSC/eJPpF3HH37meksVHvvPFrSLclq
         6vp14wen4gDIDP/ChR8LmICyEXIxutTu2v1lMQ53IKINMiGIJMfc9PcxdZnt9P7TVwCI
         q0LVurXVMaSVpReDWj0rlaFnaNNu2omNYwsyYjaeyZnBCRflv+PO8Wh6bIt/2vTZSaHv
         0Tn27AooEQRpfNQqrY2kl34mbzTQ4yg+Mtyag3uRwrcyoad/E3Gw37pay8az3cU9EXrj
         cQFw==
X-Gm-Message-State: AOJu0YzD27noJBst/pCT7AFZI7eAmvIWnta5D4tSBD3oKtqiB2jLe4KB
	aYLxFtraTT2R1fnZhIxMo7Dy6AFfG63tqIzTpJB3yyk9W0TWBpsf
X-Google-Smtp-Source: AGHT+IED0Jo+m4vn62A4S/wsZ5q9JXi2O3Tn/SaXIP8LzelW9ADDiwcSX/jikpB/5dtI/Ug5l1KmUg==
X-Received: by 2002:a05:6a00:14c6:b0:714:2533:1b82 with SMTP id d2e1a72fcca58-718e3455a65mr1375088b3a.23.1725666406723;
        Fri, 06 Sep 2024 16:46:46 -0700 (PDT)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-718e5982ef1sm55167b3a.154.2024.09.06.16.46.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Sep 2024 16:46:46 -0700 (PDT)
Message-ID: <25115008-7e4b-4fdd-a5de-8d27edaee609@gmail.com>
Date: Sat, 7 Sep 2024 08:46:44 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: kerneldoc-preamble.sty: Suppress extra spaces in
 CJK literal blocks
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <20240905050941.31439-1-akiyks@gmail.com>
 <bb98d966-8c3f-4351-84ae-961c7776bd8f@gmail.com>
 <878qw4ehiy.fsf@trenco.lwn.net>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <878qw4ehiy.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Fri, 06 Sep 2024 12:58:13 -0600, Jonathan Corbet wrote:
[...]
> I'd have to rebase the tree, which I prefer to avoid when I can.  And it
> *did* create troubles for the htmldocs build too...:)

Aha, this one (as of commit eb5ed2fae197)!

<...>/Documentation/ABI/testing/sysfs-bus-i2c-devices-turris-omnia-mcu:26: ERROR: Unexpected indentation.

To be clear, I didn't anticipate a backport just for the sake of fixing
pdfdocs build.  Lucky for me v6.11-rc6 has the fix to it, too.

        Thanks, Akira

