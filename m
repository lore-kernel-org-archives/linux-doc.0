Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793119236;
	b=Lt05x2onUQ6CG79elEJqnT7fsJ2sN0Y6RLWjZWE81iDG+dQ9SyCSwjmmrX+TIuENTDRc
	 P9n8b80fpY2x9LuKkMeuD3cycNwFyJb/RjQ/3PH8ACb7lxDAAN3zALxdRHYsnYRnZ4Gz8
	 wlrMc8upSG+XsAbLo8QvD+72tjsqJTGKifRnhBlegmXS0IetQSiSAvTf6hLokghIRj0ja
	 E2Zu3+SlZqShkPX6CQhpRKfqgYtqxZzNT/2CoaTecJ+H7lTXOI5AJGfWsVNE1sgSzM/yO
	 zr2FORjmfpfxurns//S4pkYAtiAznnSmw/LV21Obwyx1vcZukW7jMy9LOQ9XXXbMnRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793119236;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=0vGOrY3CisGPc8VMRVO//aXg6OQh93vx7xg6bEqOVs4=;
	b=cqvO4T7IwUJSea5CGXfmH+o4BapacTfs9oo5C8XgFf16ykP3sn8sMdUAEHy+2np7ugB2
	 TzyA6qFQS6Al9GAvjpK1NQijuDVQwEUZWkK80IfSlJM7U6x9sRLtguJDGAwQyG//iSH0P
	 QnoEKDEpFHhW42WdXm+sjvyq02veOycIIoV6OvhpgihZwQA5HgKRywxC2Gh/aiXtaFYml
	 yfL0DRCIMI/KskJBosAKHzMIsBjTh6aGRHfN9yakkNfnVxqJO0Le2mcvzEJfs5UUx5yg1
	 9+y63oxUmKcS1od3Iq17Falx7BqQEmRh1Px2toe5bUC6BX3cjDLEbpst5324fQe08xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=B9pgIkEN;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A9C606A31B
	for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 16:40:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8A9C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=B9pgIkEN
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cd62c570b5dso91778a12.2
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 09:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793119235; x=1793724035; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0vGOrY3CisGPc8VMRVO//aXg6OQh93vx7xg6bEqOVs4=;
        b=B9pgIkENP1nZt32P35HL6R0QxS18tatDUdKB8+Mex6frfRryvJ9HnZJ7yNzfYATxhk
         mTrYNth1sJ7pCfjLGBXbFdbG3yuaxupUx6NbUaEWi/y1Uy1q26SBQQf/tSjOD1IJGvsz
         l/pr3UYOepZQugq4IDXYNoHxly1ZnTRA2eYRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793119235; x=1793724035;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0vGOrY3CisGPc8VMRVO//aXg6OQh93vx7xg6bEqOVs4=;
        b=D415hyMY1dnyWrWFKC6R2WLEXA0RLGWztB+FasThMiC9C2Ku+tUrNg7A/Zn42Z+Pbt
         ZI74mEf0WfzbMWtsKXp3FxMXJbC84XW7jpd4HdipDjDg9DgQkYJLQJmN5DLa9tJ8OJT+
         I4bhjk0WdYL8c2DYRo1N3c06ocI+DI2wATDLwn9n4gp57WYqNupAtaf4mh9XwzqYBkw3
         /bCwL7lLWlDdG8c+uR1bJvXTBYdnEIi9pjQjVwIIf8VKY/hUG7IhmZE6OTXQn0kxat4e
         UzxYroGxoA8lxKD/UYmY74UjxoIuUEV06LHeJrtZCBfiIRQNmObWZXCc1VJsqHxDnyWi
         6meQ==
X-Forwarded-Encrypted: i=1; AKwUvBzgADOitLiS7TmZXe0BagzjLbEY/m00JIYp0wYfW17XOfXq2ewRYk9rjnmXeL7M8XX5i8JnS7y84zA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLeDCd/c5jg6qKMdrHWcJ4tHNlu26AQrURmGmPA5EgczaEKSVFP
	QMcCDngezNzItjZA4PROD4VdzHbyaWPgmXF3FS5uasHPeqsrYNs/X8zdLfIAHd4cc4I=
X-Gm-Gg: AYBFou3buv5iWM6yGFR3umR6FCqrHFHjVRq3WQ9WjRbM2iSOHpXZvoaUfqP2i986uy6
	yAENd3Y/yWhj+7XI3TeJg8dHaMD/E/nGCoQWx23jndHBNXSPy1eFWXQGdzqXs/t6oKJxPNpm8gM
	D6U7tnJ2pR69468weO+75fs45dQUPwlmdfs6jYouCWUkmHDOA+Id6kJX4Zx+u3dMcslRv+Yz33e
	oE/qiOYKJJUfYL1NIg0bwR7nkhhPMIVZHvFULW6ye29p3Lg9xXkOz91NFQt424+JHRv4cjgD9Dy
	lAkFDb6VgTnbqgLP6O4AAzD/CS9A1zeD7c3fTdRoVqHWPzINRMKR+Th00OI/dJw2XUql56zXAy1
	3CzyA2oRDloXlcbB+ThFjYJLs8GN/wZ52Ojdx9cyGy1uJk7RoaTkqo0z55rwhdpKwBQ9NMBaso3
	Rs+9IS9C+TGPORhYld5NQSeFJZ0HOuAHYgoc+2aTJWENxLykmcEwcjbYsWtFbJnDxBiMuMkkfT6
	IXxtDNIo5sYD5pXoGZHK6eCXdrB10wDMtN5NuE4Pw7dhESk0cZMUaMtH6OTHhQdLh64JYflMdNH
	Lpj2fn0FCWMnYUwjYCizVv3Z1Wy/S+vasvJ/1u1cx6CB3+hC1qSjbc9bCXpTDDoIWq1Zxhqkztg
	ncwEVjRjv17oFkLoWBiadEmV4sr1fUEzpKK/o21dJ828N0cc6lby2nw6Pew5rGL/YNwii32qCaQ
	==
X-Received: by 2002:a17:90b:528a:b0:3a4:b061:2765 with SMTP id 98e67ed59e1d1-3adead57da9mr8291010a91.15.1793119235223;
        Tue, 27 Oct 2026 09:40:35 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae4066d631sm4569992a91.17.2026.10.27.09.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 09:40:34 -0700 (PDT)
Date: Wed, 28 Oct 2026 00:40:32 +0800
From: Chris Down <chris@chrisdown.name>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	David Hildenbrand <david@kernel.org>, Kees Cook <kees@kernel.org>,
	Jeff Xu <jeffxu@chromium.org>, Andrey Vagin <avagin@gmail.com>,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>, Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org,
	linux-hardening@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 3/3] selftests/mseal_system_mappings: Test vdso unmap and
 remap
Message-ID: <auDUAN9xAQRQhnCo@chrisdown.name>
References: <cover.1793094611.git.chris@chrisdown.name>
 <621847973ba2ec49d0a58e0261da35a9f3a97eda.1793094611.git.chris@chrisdown.name>
 <auC7_5XYr31fimvL@gremlin>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <auC7_5XYr31fimvL@gremlin>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

Lorenzo Stoakes (ARM) writes:
>Sorry, in mm we require commit messages. Even for tests :)

Sure thing, I'll add one.

>On Tue, Oct 27, 2026 at 07:43:25PM +0800, Chris Down wrote:
>> Signed-off-by: Chris Down <chris@chrisdown.name>
>> ---
>>  .../mseal_system_mappings/sysmap_is_sealed.c  | 92 +++++++++++++++++++
>>  1 file changed, 92 insertions(+)
>>
>> diff --git a/tools/testing/selftests/mseal_system_mappings/sysmap_is_sealed.c b/tools/testing/selftests/mseal_system_mappings/sysmap_is_sealed.c
>> index ea75ad537620..83b4fadfbfe7 100644
>> --- a/tools/testing/selftests/mseal_system_mappings/sysmap_is_sealed.c
>> +++ b/tools/testing/selftests/mseal_system_mappings/sysmap_is_sealed.c
>
>Why on earth does 'mseal_system_mappings' have its own directory...??
>
>Ugh I don't know how I let this stuff go on the original series :/
>
>Please, for the love of all that's sacred, move these tests over to
>tools/selftests/mm/. This is an mm feature, for our sins...
>
>You can do the move as a prerequisite patch in the series.

Will do, I'll make the move the first patch.

>(And, again, I really do insist on your change doing some cleanup here as
> well rather than extending this stuff.)

Yep, see my reply to 1/3.

>> @@ -10,6 +10,7 @@
>>  #include <unistd.h>
>>  #include <string.h>
>>  #include <stdbool.h>
>> +#include <sys/mman.h>
>>  #include <sys/utsname.h>
>>  #include <zlib.h>
>>
>> @@ -232,4 +233,95 @@ TEST_F(basic, check_sealed)
>>  	EXPECT_EQ(expected, sealed);
>>  };
>>
>> +static bool find_vdso(unsigned long *start, unsigned long *end)
>> +{
>> +	char line[MAX_LINE_LEN];
>> +	bool found = false;
>> +	FILE *maps;
>> +
>> +	maps = fopen("/proc/self/maps", "r");
>> +	if (!maps)
>> +		return false;
>> +
>> +	while (fgets(line, sizeof(line), maps)) {
>> +		if (strstr(line, "[vdso]") &&
>> +		    sscanf(line, "%lx-%lx", start, end) == 2) {
>> +			found = true;
>> +			break;
>> +		}
>> +	}
>> +
>> +	fclose(maps);
>> +	return found;
>> +}
>
>There's shared code for this kind of thing, please don't duplicate a
>/proc/self/maps thing if unnecessary. Also there's a nicer ioctl interface for
>all this.
>
>See vm_utils.[ch].

Oh thank you! I will use that.

>I mean arguably this is an mremap test that belongs with mremap? I guess
>debatable...

Hmm, I'd lean towards keeping it with the sysmap test, since it's really 
testing that the seal is enforced on these mappings rather than anything about 
mremap() itself, but I don't feel strongly if you insist, just let me know.

>This all just seems like work that should have been done in the past when this
>feature was proposed, and doesn't depend on your changes at all AFAICT? Maybe I
>missed it though.
>
>Valuable in itself, but probably worth sending separately as a result? Otherwise
>it's a little disconnected from the actual change you're making.

Yeah, it doesn't depend on it. I can send it separately on top of the move if 
you like, I just don't like touching things without tests where possible.

Thanks for the review!
