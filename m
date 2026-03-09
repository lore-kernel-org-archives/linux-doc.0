Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B8C3D1CA4
	for <linux-doc@vger.kernel.org>; Mon,  9 Mar 2026 16:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773075368; cv=none; b=SpNFSAvy57ksH04SP1sM0SbYBzu/U3H1+SctOL0nG6ZArxuFfDRGs90fj4fRcQTpBj/UptcDGVfrgJeNwHjKUqJwxywouzjXrtz/8KTrQimOf/NtDKsvxzyQQU87sPeCumTpqXgXONGcZVSxtxhuIQZlW6UbNE07QoQSsjOLwSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773075368; c=relaxed/simple;
	bh=dRr8SStoRZls3+slMxETe+hGVnNj1UNyuU2pUvKsvis=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Tcvx0Jy9s2G5Ynp+cmcgnLPQc/s3FUv+88/lCYvPep8wxYXf1J04YTYrTsEWmmJS81StHJLlm35Kf5PRoHRe2+eLuaVIcdieIhSW7azrGiI+iCia91cs3jpUGlUM3gXF0v/NF4eNdhcc8GjNSJNMERnaN3vP6MGxwmAM6SD5Vsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G3TdOvOM; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G3TdOvOM"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ad21f437eeso86554875ad.0
        for <linux-doc@vger.kernel.org>; Mon, 09 Mar 2026 09:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773075367; x=1773680167; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+kcfZXOS73GCcH3OQqmXVNvwNk/1zURgtKz5sokOakQ=;
        b=G3TdOvOMBOO9IMb75DvaeRqGHFiORKg2+AC8s6TPkGncvvcugtZ547hzY/23Y4GQib
         Vqny4VUqxr5ZY0LPw9YnmHeWehZfxI3Q7yNZ+rdEwJzjqetHlel0lLzP3oRzWU9z1oak
         zYucuX4SrJM9ssslfoaEZz/vWRGPMDLcEqByZRO0mKb95gVLzcwLVljJqJLYJYPnHXWq
         RhMkjo+oqQWSfdCWgmRykQGvR9W+JCWtyUHGt8oP7Bz+/V+vScTbO9D9+z+GN2cxvbpR
         WYWC8WVjy+1KBaHIoQz8SbV4K3eA7NqBNMvsypMeKte/6BHjv4syMuY6GXK7X+CY+x6s
         pVlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773075367; x=1773680167;
        h=content-transfer-encoding:in-reply-to:references:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+kcfZXOS73GCcH3OQqmXVNvwNk/1zURgtKz5sokOakQ=;
        b=XD5GjTPzKl0sl/V29URg+758hQO6dJA5mjvVv/3U+hJTVcweebUFvcg1peyuLRIrYZ
         UgUDEDTDIuBgrrrQjWnv7k9avlqDCzJgPZbojrXYpyQjHyIpKDLX9THo1Bz1watT/KDi
         WO6FV+OZsrRdZcf7qyPVaYSxlTzDrhB/MDBq5+86P5U8JtgzxEBefMVlhTZpN3zvbkv6
         miZ4YgdC6wsw3zMp+pRpcoH8YXUeGjHb/00N8zW23oyZX0YtfHWoBi9Ex7eJ00tmZlXE
         jUsYfg5gezyOv1/5f0PVio8GqVUTJmAptO0qcFS+QyyXCqF3bbdNVXU/tgBYAMv//6Fj
         gwRA==
X-Gm-Message-State: AOJu0Ywrz2k88lCbP6cL06YxS6z4KOtfSy405vVPNbSdJTc0/83Kmdom
	4fO9RPsxLZ1XVLtoMPXNof4kmQ7+MWRzNFIrxzHNqPILUGnlwlUATSBz
X-Gm-Gg: ATEYQzzmliFurg4xoBmR9ekA0fKCqxkNSs1IV98jg1ko5fk/oa9SZWfzyTa583tPY1T
	FLznuk7AKCrbpXLuCZFToA4iXKUPV7s61tdaXz7Iiw2Z/jPih/j5cy3Qo8EJmfVCQ/SbMcNgD4f
	Vfn3gT60ZbLjBdBgV6oGSftT4+0UTWMRNihfD7+AOgYYMBEHtJC5bEM7yAr0QhOGLe7kZstMBik
	+O31vc0kAGeu8X5vEc8Ex40xyqmINpbdJNdX+x919QMHlMYFkeMNyDmDds9qbqeitDopV6v4yua
	jdImU5pMs0j0Yey8k61haDKapIJAtixM9RIysImcXIwYVRbx3tmYXZj+hINgVsThPHEpOEri0xP
	4kTTqCFGo/LVXnKme+HH3aSH2RKAiLjC1eRLYQGPjAQcDh4I5BpvrohkRAqW48woEHWCSAfL6Au
	puI9zbq4Io+RbQzJ7ia4hC26rkscM0H02MPZfRVI+g3lY1k1My7s0uJev+cw==
X-Received: by 2002:a17:903:37cc:b0:2a7:5f26:aaf9 with SMTP id d9443c01a7336-2aea1de8092mr2161755ad.14.1773075366517;
        Mon, 09 Mar 2026 09:56:06 -0700 (PDT)
Received: from [10.79.58.83] (wf121-083.ust.hk. [175.159.121.83])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e57b09sm155892475ad.4.2026.03.09.09.56.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 09:56:06 -0700 (PDT)
Message-ID: <b497e871-f9b8-4e3f-bc4f-eec9c76adca2@gmail.com>
Date: Tue, 10 Mar 2026 00:56:04 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Haoyang Liu <tttturtleruss@gmail.com>
Subject: Re: [PATCH v2] tools/docs/checktransupdate.py: fix all issues
 reported by pylint
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Dongliang Mu
 <dzm91@hust.edu.cn>, Yanteng Si <si.yanteng@linux.dev>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260308104135.9037-1-tttturtleruss@gmail.com>
 <20260309074716.10739-1-tttturtleruss@gmail.com>
 <87cy1dxaka.fsf@trenco.lwn.net>
In-Reply-To: <87cy1dxaka.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 3/9/2026 11:54 PM, Jonathan Corbet wrote:
> Haoyang LIU <tttturtleruss@gmail.com> writes:
>
>> This patch fixes all issues reported by pylint, including:
>> 1. Format issue in logging.
>> 2. Variable name style issue.
> I'm somewhat unconvinced about that second change.  We haven't come up
> with a coding style for Python code in the kernel, but I think we do
> want it to look at least a bit like kernel code and not just defer all
> decisions to tools like pylint.  I'm not really opposed to this change
> either, mind you, but the process of getting there worries me a bit.

Dear Jon,

My initial thought was that 'HASH' looks like a global-style constant, 
while it's actually a local variable. However, the lowercase 'hash' has 
conflict with python built-in hash function, so I renamed it to hash_re 
to indicate that it's a regular expression.

>
>> Fixes: 63e96ce050e5 ("scripts: fix all issues reported by pylint")
>> Signed-off-by: Haoyang LIU <tttturtleruss@gmail.com>
>> ---
>> V1 -> V2: fix variable name style name and keep the format consistent with other logging format
>>
>>   tools/docs/checktransupdate.py | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/tools/docs/checktransupdate.py b/tools/docs/checktransupdate.py
>> index e894652369a5..cc07cda667fc 100755
>> --- a/tools/docs/checktransupdate.py
>> +++ b/tools/docs/checktransupdate.py
>> @@ -76,11 +76,11 @@ def get_origin_from_trans_smartly(origin_path, t_from_head):
>>       (2) Update the translation through commit HASH (TITLE)
>>       """
>>       # catch flag for 12-bit commit hash
>> -    HASH = r'([0-9a-f]{12})'
>> +    hash_re = r'([0-9a-f]{12})'
>>       # pattern 1: contains "update to commit HASH"
>> -    pat_update_to = re.compile(rf'update to commit {HASH}')
>> +    pat_update_to = re.compile(rf'update to commit {hash_re}')
>>       # pattern 2: contains "Update the translation through commit HASH"
>> -    pat_update_translation = re.compile(rf'Update the translation through commit {HASH}')
>> +    pat_update_translation = re.compile(rf'Update the translation through commit {hash_re}')
>>   
>>       origin_commit_hash = None
>>       for line in t_from_head["message"]:
>> @@ -131,7 +131,7 @@ def check_per_file(file_path):
>>       opath = get_origin_path(file_path)
>>   
>>       if not os.path.isfile(opath):
>> -        logging.error("Cannot find the origin path for {file_path}")
>> +        logging.error("Cannot find the origin path for %s", file_path)
> Why was this change made?  The first time around, you'd simply added the
> obviously missing "f", which seems better?
I used the "%s" style mainly to keep the logging format consistent with 
the other logging statements in this file, which follow the same 
pattern. To me, using f-string or lazy format.

Sincerely,
Haoyang

>
> Thanks,
>
> jon
