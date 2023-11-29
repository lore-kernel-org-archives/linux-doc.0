Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Bp9Ils0f"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BDD7F4
	for <linux-doc@vger.kernel.org>; Wed, 29 Nov 2023 05:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701266005;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fCRlZ8oiqaJTBcB7G2DHmy/vp26Z550XjGVY3C3y2Oo=;
	b=Bp9Ils0fKZ2EoAPIbvNkEYO+UTkL9GZnYvtvkblh6i2jQZZG9Gqz3chpLjxWdg2DTktc6m
	T8qSvLoOwChGOhqlNXbwdjYB8D+ehWhrn+994v2dRi8+RGCD2vL57mDxm057XIpUKUckGI
	l1l9XKeGzGju1uNsk/ahLJnDTOqDFT0=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-177-bP9z3HV5Ph-jUj0aBCc_lw-1; Wed, 29 Nov 2023 08:53:24 -0500
X-MC-Unique: bP9z3HV5Ph-jUj0aBCc_lw-1
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-4644ca0a48aso156863137.2
        for <linux-doc@vger.kernel.org>; Wed, 29 Nov 2023 05:53:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701266004; x=1701870804;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fCRlZ8oiqaJTBcB7G2DHmy/vp26Z550XjGVY3C3y2Oo=;
        b=l7+VKBXLn5VId/MUvr6V4A7OoboI2PKJ5hrTaF1E0Iatv0RxGTtWUfpnBmct3oBmy1
         cXYycaYRTRADtvzm4OGk6+hDANmIyvz0oUCHvXjHak2LgsU6H0KmOd4fbJd7LLS24ttq
         S9Fv1ZD0lFbvgItOC9pWgoRTjHrq9LijlDHHx8H0X06YZ3TbLbvKnFfZlPmRQdZoD/Rx
         pXj2pTu5jgvSfqAbORssZjLFVOpcZqF6nUs1Gem0GE3AoqBeCnKjvxOTQqkZBcS6phQa
         c8unPv1KPTla04wvE/oXkoCmjvlSy9Df/tHJ6XugT08nRVp3mrxvj8SWx8BUDY+g2l5z
         9kJQ==
X-Gm-Message-State: AOJu0Yz/6znVUzj0l4e15ASiNGeSxnMj1AwXsj+h/eYafwJh0GfSuBXp
	nx0xPGKZkRo8odPhHtDZEkmQ70EecYKzyZmZCbAAUAbn9nCDm9LkKpYjOcTX6RtO7VR3cj1Zq59
	1B28+4Gh0fhXIk2LfmnPuWyzQqSdZ
X-Received: by 2002:a05:6102:34d1:b0:464:4f99:67cd with SMTP id a17-20020a05610234d100b004644f9967cdmr898010vst.25.1701266003946;
        Wed, 29 Nov 2023 05:53:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG6XeoX3LySftJvfhNd92B8TROaD2k49rLLui+JpiO50N4F9wBA4UISs6o9ymk2BLyZlpB5+Q==
X-Received: by 2002:a05:6102:34d1:b0:464:4f99:67cd with SMTP id a17-20020a05610234d100b004644f9967cdmr897999vst.25.1701266003740;
        Wed, 29 Nov 2023 05:53:23 -0800 (PST)
Received: from [192.168.1.9] (pool-68-160-135-240.bstnma.fios.verizon.net. [68.160.135.240])
        by smtp.gmail.com with ESMTPSA id s7-20020a0cf647000000b0067a4396f9cdsm3018175qvm.8.2023.11.29.05.53.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Nov 2023 05:53:23 -0800 (PST)
Message-ID: <ac7a90a7-4d29-059b-fbff-6b67e6f5c2d3@redhat.com>
Date: Wed, 29 Nov 2023 08:53:22 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux Kernel Livepatching <live-patching@vger.kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>,
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Attreyee Mukherjee <tintinm2017@gmail.com>
References: <20231129132527.8078-1-bagasdotme@gmail.com>
From: Joe Lawrence <joe.lawrence@redhat.com>
Subject: Re: [PATCH 0/2] Minor grammatical fixup for livepatch docs
In-Reply-To: <20231129132527.8078-1-bagasdotme@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/29/23 08:25, Bagas Sanjaya wrote:
> I was prompted to write this little grammar fix series when reading
> the fix from Attreyee [1], with review comments requesting changes
> to that fix. So here's my version of the fix, with reviews from [1]
> addressed (and distinct grammar fixes splitted).
> 

Typical kernel workflow would be for Attreyee to incorporate feedback
and post their v2 after a day or two.  From the format they posted, it
appears to be a first(ish) kernel contribution post.  Let's be kind and
patient so they we all may benefit from the practice of iterating on
their patch.

-- 
Joe

