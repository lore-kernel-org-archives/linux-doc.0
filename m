Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA6B17D5
	for <linux-doc@vger.kernel.org>; Wed, 21 Feb 2024 01:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708479881; cv=none; b=oEEVdU7iQxzlz8e9bWrMOfUJoTur0Z+iBo0pOeNbfL3WWYzVW97rxOXdP926FrpGdLruXRheFgFgqj5cwtERORH7TKn9EalSFd31BI+9X1ic8QEXhOh+/05gZ8fk2mCq9K7ZCmhEOtx8h+tWEnWfzfd6rb84MNpN8dL03cj0SAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708479881; c=relaxed/simple;
	bh=rntGsrGT2b0FSGNjkPiXn5vaD9AYf6RyM9KYEdZyb9s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jWZf2lUdf4WYX9rUUIYOVA1kfghHvN3HwHdtdBeTXv+UHXIX4cvQTa7SFe/uKa47yDGFpsNah2ChAOeFvSTJKBV9WpU9O4qOMvumHX4OY6B/6VmNcFh0TDBgV09oB38PvH2Lgystq0pXNGrTRqMzjrRlg9xTyeWCsNQAxSFvfSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mhySLdN1; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mhySLdN1"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6e08dd0fa0bso5229376b3a.1
        for <linux-doc@vger.kernel.org>; Tue, 20 Feb 2024 17:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708479879; x=1709084679; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GfzCDASynO9nsmpFD4ZwOTbhx0ossPnGTeBc4Rvjdi4=;
        b=mhySLdN172PetUKSQX0kPLk6UzUuZRAhANdxlZd5QF853c26rsTnCnjGjVKmq5cdJR
         WrmeNuRnbADFcze64ilOMG2p6jXb9LPN3F8BxDR3VZqLG9In7qEFYfbF2shiCinaXpt7
         UjSsQYo89o/OtGtWLO8b5yJd/25HvVnawRUhyXugcDpKWvzi3p0DtCPYtP7wPdetH6mp
         D3wFrkA2+XmB2JFVgV4184C+2z9RtRUwv9FlrhIvr1J0TfCPcw0OIxX7Px0L4eoMwTs+
         QzdYZ0GfiNqB1F+VC3KGIXwswmGjDimsSIDluo8y/oi5fZJ1ttz7NZHF7hnRiDVd42K8
         Ys2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708479879; x=1709084679;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GfzCDASynO9nsmpFD4ZwOTbhx0ossPnGTeBc4Rvjdi4=;
        b=VgVhdmSHeKJ6TuLpMqvmSMSZrLZAzIRt1sXKgOEPkJpLK9WiPzEIqD77Foce1MvjZg
         PswHG0wWayYtZkfdG7x273e1B9GVa42O18MU4hjtXXjpVKWfbSBCbmS8gH40OjhJNVTV
         Oi7zy68n4Viq6/bKYH0dVufry9qJcqrVE2n+JOWGlscDeSlObAKNB0ha2n9Z9Gl0/pUL
         ZP8DZ2yE7s0lgyMc7nzdRjDpcrMfdMiCLfewgYriVtTYW7dBsSLPwoiWpsHy3g1CjXos
         3VxSJ7VluCkV+9YWfbCt2MIYOmLTfvRKWUZX9iyDESoVTV+PuCUFnoAGLpUtpUIWy0KN
         vmRg==
X-Forwarded-Encrypted: i=1; AJvYcCWMcbtPjERC8t3RcibWZj5r84Mk4ms9hXC4a/J91gKchfuvPtDIfqGvKd+/vyu6zzfkl9tNP8gOQJ9aZ3j55HSs0TpqQna6BXEq
X-Gm-Message-State: AOJu0YwhAH40UGKYI6WJink5RRrI7C2ojt4hSZzUOlBFD78S3a44CSNv
	v4lBr5tmOvsG/zin75nsTTsnME8fUyp1Gjzif6hSFDpI6J3S07H2
X-Google-Smtp-Source: AGHT+IGOiYZH9XipX5HYu8WFZB2ijuG+ZtS7/bIwVgRWox6T+xboPWhrurLRFzu9qXG/fJzXynxfzA==
X-Received: by 2002:a05:6a20:e605:b0:1a0:584e:fda9 with SMTP id my5-20020a056a20e60500b001a0584efda9mr17341494pzb.28.1708479878830;
        Tue, 20 Feb 2024 17:44:38 -0800 (PST)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id b4-20020a62cf04000000b006e4701c0aedsm3772495pfg.213.2024.02.20.17.44.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Feb 2024 17:44:38 -0800 (PST)
Message-ID: <9359a5c6-1e54-4c68-9b7c-24177dbbbe01@gmail.com>
Date: Wed, 21 Feb 2024 10:44:37 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: Instruct LaTeX to cope with deeper nesting
To: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Vegard Nossum <vegard.nossum@oracle.com>, Akira Yokosawa <akiyks@gmail.com>
References: <87jzn0qw19.fsf@meer.lwn.net>
 <685ad03e-b61c-4c1f-9080-c7298a7625dc@gmail.com>
 <87msrug5s8.fsf@meer.lwn.net>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <87msrug5s8.fsf@meer.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Tue, 20 Feb 2024 14:55:03 -0700, Jonathan Corbet wrote:
> Akira Yokosawa <akiyks@gmail.com> writes:
> 
>> On Mon, 19 Feb 2024 09:05:38 -0700, Jonathan Corbet wrote:
>>> The addition of the XFS online fsck documentation starting with
>>> commit a8f6c2e54ddc ("xfs: document the motivation for online fsck design")
>>> added a deeper level of nesting than LaTeX is prepared to deal with.  That
>>> caused a pdfdocs build failure with the helpful "Too deeply nested" error
>>> message buried deeply in Documentation/output/filesystems.log.
>>>
>>> Increase the "maxlistdepth" parameter to instruct LaTeX that it needs to
>>> deal with the deeper nesting whether it wants to or not.
>>>
>>> Suggested-by: Akira Yokosawa <akiyks@gmail.com>
>>> Link: https://lore.kernel.org/linux-doc/67f6ac60-7957-4b92-9d72-a08fbad0e028@gmail.com/
>>> Signed-off-by: Jonathan Corbet <corbet@lwn.net>
>>
>> Tested-by: Akira Yokosawa <akiyks@gmail.com>
> 
> Thanks
> 
>> And it seems this one might deserve
>>
>> Cc: stable@vger.kernel.org # v6.4
>>
>> too, in case someone tries "make pdfdocs" against 6.6.x LTS 
>> and 6.7.x stable branches.
> 
> Agreed, that was in my plans.
> 
>> Commit a8f6c2e54ddc did nothing wrong on its own, so a Fixes: tag
>> is inappropriate here.
> 
> And a Fixes tag was definitely *not* in the plan.

Now I see this in docs-fixes.

BTW, I expected Vergard's fix to the translations extension would
also be in the -fixes branch, but it is now in the -mw branch as
commit 2bd6f4d99e12.

Can you please have a look at it?

        Thanks, Akira

> 
> Thanks,
> 
> jon

