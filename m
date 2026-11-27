Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795773205;
	b=Y6rEVm7D+x5yx9kgdSmw9dQlNCbr5KGaJqcCvTD5r2UKdQP6dl7YVhVI0z9APNL0jsbq
	 xxxk01nUJl8GgRUQTHVKJSKcWrID11At289cJnmGeT+2u7iXlEiXgDDzWcF6Tic27ick/
	 xFXj7AxA49cr5nqH1WRg+/guYjbzHyLRMtJOzpybkyUcwoNzexcTDRrWnVWvnGRKsei1o
	 YQ8EFu2/+oPraMUDUPlwqJlzbEzx9BNmo01HwxE9mXX706ScjsWapqqoLLRhZ2NhsHizp
	 y203RwoMAWuqpEXPHWoVlpOTdn6pzs04IlbkPzQsJm7iLpCA0+c5LSjMwo3UCdTPVoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795773205;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=+P/IoVdF17vz38ui1CJ5JK9XByo5JmBjc3ZsPBZRB90=;
	b=TW+TDimzQBpp6KRP5+D3BR2khfLpdMX8oqRZisBgG2sktWQ5Yex3BdsqBsGO7wEzYVvY
	 aBZ+tx9k46FqwSanrtPezMv9bpxXxkYMgDhctSbCZ5Z3JBZwP1ycjDVQkyzSQduA/CZpe
	 i0OHCDwzIvCm/uevB/8ZfMtojdXGUa2TeTVoA8znk7o3YNJg/qwFCLzJbJz/b4H7/GfVX
	 AinXVqABLru0AeqKQVN7i3vam5mHhcF5EbZ+/fywYt3NDAUyn2Ysah9thbbW3l7Wc+pGz
	 aAuWuOP/zynlNn0HYmAD4/WwSG2m2ZY2kaXk8dnUTtiBg4SBcNiKWDYbTO9b/YbLNPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=am2ew+ad;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FAB2606A333
	for <linux-doc@vger.kernel.org>; Fri, 27 Nov 2026 09:53:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FAB2606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=am2ew+ad
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b8a1f59d5eso10442094a12.3
        for <linux-doc@vger.kernel.org>; Fri, 27 Nov 2026 01:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795773200; x=1796378000; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+P/IoVdF17vz38ui1CJ5JK9XByo5JmBjc3ZsPBZRB90=;
        b=am2ew+adeGPwvdANDgwJ0Zt8/OcWIILnS4VI1TmusqGtbJfikoILfV7ARlpiV4G77p
         9cUfa7J6zpGFBLg31fzojDTx9yvtJY7GyQyEQF1ztDUobtOk0eknkHn8DbDoCrBucKEe
         bLkkUFPzj9lgdIEP3HIoquJCs1MeURpxHodkuN/wJ3NmICKS/nFrdx+ANnWQXx2WWkB0
         IcCuSnlitPY8NDWVqx5L82P1VMaB/joGiAq3PGqPrcB1YRXDqESTwZHE01Wr3f+69W01
         SYxPrd1LW568jgZs5TdpDokliKalBd+Gdonm6uHuO9i+pcIAZxoKk7b236uOBnfzQEec
         MFXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795773200; x=1796378000;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+P/IoVdF17vz38ui1CJ5JK9XByo5JmBjc3ZsPBZRB90=;
        b=NnVM1lXuq2gHclGLpAL+j0aA6X0aNFZe7nUOTR3VW4cvxX3zHseia1UPcgspRxpHWB
         T72gqSRPjnrLSYYr64VT7KszdojbTU/LJhV2VrQmmCb38hPZ4+nRLUcMgLU0o5Kvzx4Q
         ud6Rlq1YY0+9O3RKbnaWTquVKPWU0WgEC+iLWXsE3avw+WWZk/sj9IMowv2JAFyJwdFR
         ocMSVlg5ZcBnPevTgtUP2dzHsEH314XcAWGD9U5uke/rOANYYrCI/BvoWtslioaGPi4M
         lEwKPE0N0cnvveOGjvTdBJkHAGjjHnmNsRwqf/zo5KHd5lx/qSCFvVSvHwE79JgBowPM
         TVkw==
X-Forwarded-Encrypted: i=1; AL+hErG+vOIKQFeeMzYCTJjBJakGdPtdzGEDDnsKKrPgkN/lHGvioLLRFOu/CWW1G7/MpWKR5CfU26eooho=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mCvr5g4f/egcJnMgxJzc0JZFzef5bChiZ6YgrgIA9B07lB3pH
	dWLH6kM+nSJ/vVEkNWJObDzVC2JAP/9mQxhMPkN9rSF2J5Yzc4GhvlSQA89vez9Vr4Q=
X-Gm-Gg: AZFdTZcs8E7RkqqBkz1F3z2lva2cgCOHOUWHsZvKfj9ad7GyFZePTNmq6DloqzXgnp/
	JaP6eoEv4Z72Z4z53s8296Xb4XJ48Y/Z0nb8XDjtMSzk5rOeBqHuxd4yWE0gqcQSFNdzMpCRXl/
	bxde5+jrqqg3Q+IsHNfodXUOtMvvEyxk5r+5ukD/YLsA70EbC4D6st+n6OTfagnbJJ/9I7f4uhj
	JyE8Y0HKnY2SsDF2u2WtsO+mTsehhDBcuc7RufGwjJCyw7lkHarjaTZ7buBe1bDFNvAL6UEUN1H
	kUcNMsv7Yis98PkYDoKz/s5OyYhiK9VnzJkmI8cHx/CzjLgilJK1nOOdgDBXsLWVavnwXSlxaV4
	kez4JvSyR0lcSG0iOsd/j+TfEL/rnzEyRdFL3zEKXUswbQx3JU4o57fi2XFJ47Fa7v4hl23wjgx
	pauPN3qheLtByHrmU8BoFholgnT1aqML59iwXqGPJ59iiYlObh9t6llQjl9FdK2ZOQkTBWFpenr
	yaJB6s4qFT7J7z3i/Jay9TJb8wssRCRac/n8aSuDLqUuOFD1v82KU6AqPaN1hegBw4d9sWGzKPb
	IQY7QWnhOBnX22GU7A7UGGWgyF3E7BdcJ5NAU1gWOYc=
X-Received: by 2002:a17:907:1b0b:b0:c51:e06a:4744 with SMTP id a640c23a62f3a-c51e06a478emr88319166b.7.1795773199448;
        Fri, 27 Nov 2026 01:53:19 -0800 (PST)
Received: from [172.16.0.229] ([159.196.52.54])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87343f571sm11900316b3a.34.2026.11.27.01.53.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 01:53:18 -0800 (PST)
Message-ID: <978c5ae0-8cf2-47d4-8fb5-1d96896132be@suse.com>
Date: Fri, 27 Nov 2026 20:23:13 +1030
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] btrfs: add a maintainer entry profile
To: Leon Romanovsky <leon@kernel.org>
Cc: linux-btrfs@vger.kernel.org, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <0037554862c0d9dce3ddafd1238347e4b16a5079.1795581896.git.wqu@suse.com>
 <20261126133712.GN774860@unreal>
Content-Language: en-US
From: Qu Wenruo <wqu@suse.com>
Autocrypt: addr=wqu@suse.com; keydata=
 xsBNBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAHNGFF1IFdlbnJ1byA8d3F1QHN1c2UuY29tPsLAlAQTAQgAPgIbAwULCQgHAgYVCAkKCwIE
 FgIDAQIeAQIXgBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJq3ujyBQkUpLw5AAoJEMI9kfOh
 Jf6o8OIH/0mqW+TQM4m2x3hCsnK+oB4yJH1qnGvIhFF/Lhs48wI02sGh6/4aA0hkCDfd9LHQ
 +ci4FUepZ9y4VS01+oIExbg/8ytzGYTzLtb44jK2GBOBVSJkMiha6jp22XFt7WUkT/tvbreu
 WWdGsaJIRQaZChy7xsMI8lqQ2WdmluZJ4LT0wD3l/l6QU1ZseMGySebdY9sVOQEOJNV7Qj92
 /KOAFNmeZshV/qDI8Iw1RTs6TvLqCcqmlZLCmJkYSVhT1RonWRren8xIRcFEgMe004IDnt7V
 qdQhk/nhTS9x9MBAhMRl0TTE1VKDLvVALsud3iZLrmmtYvwPApzGJk052f0m28vOwE0EWdWB
 rwEIAKpT62HgSzL9zwGe+WIUCMB+nOEjXAfvoUPUwk+YCEDcOdfkkM5FyBoJs8TCEuPXGXBO
 Cl5P5B8OYYnkHkGWutAVlUTV8KESOIm/KJIA7jJA+Ss9VhMjtePfgWexw+P8itFRSRrrwyUf
 E+0WcAevblUi45LjWWZgpg3A80tHP0iToOZ5MbdYk7YFBE29cDSleskfV80ZKxFv6koQocq0
 vXzTfHvXNDELAuH7Ms/WJcdUzmPyBf3Oq6mKBBH8J6XZc9LjjNZwNbyvsHSrV5bgmu/THX2n
 g/3be+iqf6OggCiy3I1NSMJ5KtR0q2H2Nx2Vqb1fYPOID8McMV9Ll6rh8S8AEQEAAcLAfAQY
 AQgAJgIbDBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJq3ukKBQkUzDspAAoJEMI9kfOhJf6o
 SNsH/1ysUWOKmzY0rGS3ZdS61QgqMGhSWD/EJ4UiPw+xO4l4+GtX0fOAqxqsmBKqje3vyhBa
 Z5o/1Y+gNiN+E6RBcSz4b1TAd78sQ2bvT5DWOvBjeeVxHdiuQMIn4S8xk5ZpySBw5ifjoiuL
 0M33UVtJOzM8yfAeL+d/Rp4leJw72SutjkLyZTG/gJIp4pJGD/kFHn24OLL0IxEcO0gOekNZ
 os5e1R6jAJ2ILk7+MDnvU8wXHcCiVzuDhJLI1tih1uUIE50muHQJWbYuVBbdJeu8WlIDDssx
 UOCxLylNG3gDXV5MhLubPTOpp9OiFc/XC37nvkgEcrlmlOFBv4/NJCbECpo=
In-Reply-To: <20261126133712.GN774860@unreal>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2026/11/27 00:07, Leon Romanovsky 写道:
> On Wed, Nov 25, 2026 at 03:16:21PM +1030, Qu Wenruo wrote:
>> This new file is mostly based on my personal preferences, focusing on
>> how to improve the human readability in the LLM era.
>>
>> The new file should also act as a guide for humans that want to be a
>> long term contributor to btrfs.
> 
> My previous comment still applies. Most of it is relevant to other
> subsystems as well, and some of the suggestions duplicate existing
> documentation.

One question is, I can't find a generic one, nor there is a generic 
entry inside the MAINTAINERS file.

If we're going to create a generic one, shouldn't we just update the 
existing docs like `Documentation/process/submitting-patches.rst` instead?

And to be honest, the current one is already a little LLM orient, 
lengthy and not well human reader friendly.


So what's the recommended next step?

Thanks,
Qu

> 
>>
>> Signed-off-by: Qu Wenruo <wqu@suse.com>
>> ---
>> Changelog:
>> RFC->v1:
>> - Use maintainer entry profile instead of agent.md
>>
>> - Further simplfy the content for human readers
>>
>> ---
>>   Documentation/process/maintainer-btrfs.rst | 154 +++++++++++++++++++++
>>   MAINTAINERS                                |   2 +
>>   2 files changed, 156 insertions(+)
>>   create mode 100644 Documentation/process/maintainer-btrfs.rst
>>
>> diff --git a/Documentation/process/maintainer-btrfs.rst b/Documentation/process/maintainer-btrfs.rst
>> new file mode 100644
>> index 000000000000..5170dd73e655
>> --- /dev/null
>> +++ b/Documentation/process/maintainer-btrfs.rst
>> @@ -0,0 +1,154 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +Btrfs patch guidelines
>> +======================
>> +
>> +Human readability comes first. A reviewer should be able to understand the
>> +problem and the fix from the message and code.
>> +
>> +Bloated LLM-generated information only wastes precious human time, no matter
>> +whether it is in a comment or a commit message.
> 
> This is general.
> 
>> +
>> +Code comments
>> +-------------
>> +
>> +* **Necessary comment only**
>> +
>> +  Comment is for things that are not obvious by itself, e.g. a locking
>> +  rule, an ordering requirement or a non-trivial reason for a workaround.
>> +
>> +  Keep the comment short if possible.
>> +
>> +  Don't repeat what the code does.
> 
> General too.
> 
>> +
>> +* **Add kernel-doc only for complex and/or exported functions**
>> +
>> +  If the function and parameter names are self-explaining, don't waste words
>> +  on the kernel-doc.
> 
> This is applicable to many subsystems, but probably not general.
> 
>> +
>> +Commit messages and cover letters
>> +---------------------------------
>> +
>> +* **Keep it simple**
>> +
>> +  Use short and simple sentences, avoid long paragraphs.
>> +
>> +  Simple patch for simple bug. Don't write a full [BUG] [CAUSE] [FIX] analysis
>> +  for something like a simple error handling enhancement.
>> +
>> +  And we don't care how you or your LLM found the bug unless it's hit in the
>> +  real world, so don't put such information even after the "---" line.
> 
> General
> 
>> +
>> +* **Prefer visual aids over long sentences**
>> +
>> +  See "Visual aids" section below.
> 
> General
> 
>> +
>> +* **Follow the style of well-known btrfs developers**
>> +
>> +  Check ``git log -- fs/btrfs`` for recent examples before drafting.
> 
> General
> 
>> +
>> +Visual aids
>> +-----------
>> +
>> +Prefer visual aids like an ASCII chart over words, e.g.:
>> +
>> +* A race. Show the race window, do not describe it in prose only.
>> +* An error handling bug in a function, seen from several call sites.
>> +* A call chain across layers, where the bug only shows on a certain path.
>> +
>> +Example, a race::
>> +
>> +   CPU0 (endio)                       CPU1 (fsync)
>> +   end_bbio_data_write()
>> +   |-btrfs_folio_clear_writeback()
>> +   |                                  btrfs_sync_file()
>> +   |                                  |-filemap_fdatawait_range()
>> +   |                                  | Returns after writeback finished
>> +   |                                  |
>> +   |                                  \-test_and_clear_bit(COW_WRITE_ERROR)
>> +   |                                    Still 0, skips waiting
>> +   \-set_bit(COW_WRITE_ERROR)
>> +     Too late.
>> +
>> +Example, an error handling bug, from commit c9583ada8cc4. The callee cleans up
>> +on error, then the caller cleans up again::
>> +
>> +   btrfs_do_readpage()
>> +   |-submit_extent_page()
>> +   | \-submit_one_bio()
>> +   |   \-btrfs_submit_data_bio()
>> +   |     \-bio_endio()
>> +   |       Calls end_page_read() and unlock_extent().
>> +   |
>> +   \-end_page_read() and unlock_extent()
>> +     Cleaned up again, the subpage reader count underflows.
> 
> General
> 
>> +
>> +Versioned patches
>> +-----------------
>> +
>> +* **Full history**
>> +
>> +  Include all versions, not only the changes of the last version.
> 
> General
> 
>> +
>> +* **Newest version first**
>> +
>> +  E.g.::
>> +
>> +    v3:
>> +    - Rename the helper to xxx()
>> +    - Add a missing lock in yyy()
>> +
>> +    v2:
>> +    - Fix the build failure on 32-bit
>> +
>> +* **Changelog location**
>> +
>> +  Put it in the cover letter for a patch series, or after the "---" line for
>> +  a single patch.
>> +
>> +  Don't put it in the commit message body.
> 
> General
> 
>> +
>> +Review
>> +------
>> +
>> +* **Follow the review**
>> +
>> +  Don't send a patch and just forget it. If you're not a well known developer,
>> +  it's uncommon to get merged on the first try.
>> +
>> +  One will need to communicate with the reviewers to get at least one review
>> +  from a well known btrfs developer, before getting the patch merged.
>> +
>> +* **Check Sashiko**
>> +
>> +  Sashiko posts AI-generated review for patches sent to the mailing list. The
>> +  btrfs list is at https://sashiko.dev/#/?list=org.kernel.vger.linux-btrfs
>> +
>> +  If a report is valid, address it in a newer version.
>> +
>> +  If a report is obviously wrong, it can be ignored. If the report is wrong but
>> +  the reason is not obvious, explaining it on the mailing list can help.
>> +
>> +Testing
>> +-------
>> +
>> +* **Run full fstests**
>> +
>> +  That's the main test suite we use.
>> +
>> +* **Testing procedures and results are only for complex patches**
>> +
>> +  Simple fixes shouldn't need a long paragraph on how to verify the fix.
>> +  Those simple fixes should be explained well by the commit message and code.
>> +
>> +  Bloated LLM-generated test procedures and results only waste human time.
>> +
>> +Before sending a patch
>> +----------------------
>> +
>> +* **Check the development branch**
>> +
>> +* **Check the mailing list**
>> +
>> +If your bug was found by an LLM, someone else may have already found, or even
>> +fixed, it.
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 44540a1eb2b8..55f0b3dca133 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -5838,9 +5838,11 @@ S:	Maintained
>>   W:	https://btrfs.readthedocs.io
>>   Q:	https://patchwork.kernel.org/project/linux-btrfs/list/
>>   C:	irc://irc.libera.chat/btrfs
>> +P:	Documentation/process/maintainer-btrfs.rst
>>   T:	git https://github.com/btrfs/linux.git for-next
>>   T:	git git://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for-next
>>   F:	Documentation/filesystems/btrfs.rst
>> +F:	Documentation/process/maintainer-btrfs.rst
>>   F:	fs/btrfs/
>>   F:	include/linux/btrfs*
>>   F:	include/trace/events/btrfs.h
>> -- 
>> 2.56.1
>>
>>

