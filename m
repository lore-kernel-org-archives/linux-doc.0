Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621688468
	for <linux-doc@vger.kernel.org>; Sun,  4 Feb 2024 07:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707031292; cv=none; b=cq2X1vdfJCM9VS6iiSSM2paiFYAZk8XwkTkTG8OTQPtL3RrXHNj0rz1rUa8jIl/PlAduniT31hyOPj69NZRzSJOJwAAWJW+nd2T0CvQTQdaQ21YNGRuNAt5V6t8HZFLw1bpDGcRonfT2pizzVEXejPy9KgLQ/pY/YOzooiWiejQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707031292; c=relaxed/simple;
	bh=gEevg+1dxDe/QAYL6JsXxGvTkbcC8kki97kAPPCkmUU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wz5h2C62X/ExhiXhzJibrCE7BNvqfL22NSmsmF6asBJAKJW0ZQJ6Ze11yeaucp0urzaLqlo09HVr8Dv9ue+txiYBh/GrMEQ2IV4xoP5dbxbSmZN2eW92yzwIgAbuLsdYD4Vbko9iXU+1HT4ldRYtubvC8nMoGbCZf6d/DwoOWeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iFZtEAf0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iFZtEAf0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707031288;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kn4EMczR8KRHC+2SPU7ejPLyHZhOk5FjkDgRN4af+co=;
	b=iFZtEAf0hFyTB80uZDpoSKRLXtLJk+7Lpa2+aEJNmLiMLrj7xdW3qkY0whNHHHcJj9ZYOb
	ImDhGimC0kR2hPb/RZxszThQ8xCEbHw8x2pzimukHhr0GJn9sQOGsZu6eg9L6+HsjOEK7V
	Mcjo9p+X94/8Q4FqpRv/UZIMlIlr41M=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-691-23RjMoZMOsqdPp6-r1c-eA-1; Sun, 04 Feb 2024 02:21:26 -0500
X-MC-Unique: 23RjMoZMOsqdPp6-r1c-eA-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-40fb9d0cfb7so18295145e9.0
        for <linux-doc@vger.kernel.org>; Sat, 03 Feb 2024 23:21:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707031285; x=1707636085;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kn4EMczR8KRHC+2SPU7ejPLyHZhOk5FjkDgRN4af+co=;
        b=HrQV/zu/uPo8FF6mYE5rFaqVwCzoXq9bR2QNMB1m8olUJprmJM89J8cRBbxRs8DwOX
         VP5Zao4MrxlxoziRViOwoyMZhV1gc45Nt60+fzCNNEgjUKMWQDbbuOZqQaDE/PTiVLpy
         yn9UOk74hNUru1OVn2JkRMc4byqLdh37N0WmF4IkBYNqHT54/LEjtDEFxCRutqxDcW8t
         caegxxCKZAMUw8JQGx1vj8PAHXNM91MnoqLJcXLtOPJ/Js/L8uA5pOaU74GJU3bP0rHt
         zGwcaN+i8HhSHiSsZ2GhjBhPwF6cY2mRwnChbcmGF7BAknXjtvhAbt3qbRCSQeoHubqA
         HFcQ==
X-Gm-Message-State: AOJu0YzsaORaLPJdFdiFh78gCnM7+eP49VXFKvqs+5z6dh95iFdkUlBy
	77eKgyE1YZcT9MJElpw9uv1tf1jyUX9FOngWM0n6AvSHdM+wfRgZwBHje8OwqSbQlsHWj5htsMY
	5sYb4WZUaAgOcYXmSwkJe0cOJLkVHoKVjWjGIMU0rsmy/mXCy+byPAh14pg==
X-Received: by 2002:a05:600c:4fc8:b0:40f:c5cc:e756 with SMTP id o8-20020a05600c4fc800b0040fc5cce756mr2016725wmq.32.1707031285485;
        Sat, 03 Feb 2024 23:21:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHge0h/NvoTSnDo+I/rmQq8+cW0nD55RkqsJL52QTAyMzp1mhlRek+4MnAC6mX8o5TAWAnRRQ==
X-Received: by 2002:a05:600c:4fc8:b0:40f:c5cc:e756 with SMTP id o8-20020a05600c4fc800b0040fc5cce756mr2016716wmq.32.1707031285215;
        Sat, 03 Feb 2024 23:21:25 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXyoBvcf3og8OCdSpDWCLa6qNDnPDdEg8dgG/XT/AKQc4+UIDwwPU5pPP1cfsQAQyRe6Z0bFQeLLmCZZmhXINDK5e51XswgC4FBUcro+2a/frBNOhnODCY4aA+7/Y6Vqq5QbpMYS3flwmE8DtU=
Received: from [192.168.1.149] ([212.76.254.34])
        by smtp.gmail.com with ESMTPSA id h8-20020adffd48000000b0033b0797cc14sm5395709wrs.51.2024.02.03.23.21.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Feb 2024 23:21:24 -0800 (PST)
Message-ID: <23509de3-beab-4afd-b76f-4d675797e7d7@redhat.com>
Date: Sun, 4 Feb 2024 08:21:23 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 12610/12662] htmldocs: Warning: file
 Documentation/ABI/testing/sysfs-platform-silicom#20:
To: Randy Dunlap <rdunlap@infradead.org>, kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>, linux-doc@vger.kernel.org
References: <202401070202.BQvPxgyp-lkp@intel.com>
 <97f7e278-725b-4453-aae9-6a80664920c7@infradead.org>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <97f7e278-725b-4453-aae9-6a80664920c7@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Randy,

On 2/4/24 02:26, Randy Dunlap wrote:
> Hi ktr,
> 
> Sorry for the late reply.
> 
> 
> On 1/6/24 10:13, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>> head:   e2425464bc87159274879ab30f9d4fe624b9fcd2
>> commit: f24945c77ed4c57b602632b9e3cbf5752e202a6f [12610/12662] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git
>> reproduce: (https://download.01.org/0day-ci/archive/20240107/202401070202.BQvPxgyp-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202401070202.BQvPxgyp-lkp@intel.com/
>>
>> All warnings (new ones prefixed by >>):
>>
>>>> Warning: file Documentation/ABI/testing/sysfs-platform-silicom#20:
>>
> 
> but what was the warning or problem here?
> I don't see it.

This has already been fixed by:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=41237735ccde2cc3fe1d83ae0b776a085be6a22f

Regards,

Hans

