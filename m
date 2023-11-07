Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260E57FD
	for <linux-doc@vger.kernel.org>; Tue,  7 Nov 2023 00:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HT/GVpBi"
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F33A8BB;
	Mon,  6 Nov 2023 16:11:30 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1cc3542e328so34590935ad.1;
        Mon, 06 Nov 2023 16:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699315890; x=1699920690; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u7B09rSr5GJkw/0dQmc8mF4yG+hQAobhEyf39vTwquM=;
        b=HT/GVpBi8GWHSYZqZKFWymZHpHJKVA3HsuEOewYYqVGSexFyClkJ1po/zQFNlofarF
         4JxMymIC322pMsPm/MFFYml9oeJa62bXFSYRMsjVc3dFCMt85hbb9Urna6OI/NPFF9IN
         DxX1w04YBbJt4RY2jez/IP37LXI498M8jFNk/5jcXskJwvkJtBCtlUNVvOdbq3IDf+9T
         0gxp8ekRWWefhPAU0QzSlQXHUtU+qEilWfiem0C5p16C3PjeOzmEF5RmHzIjGav1rDtV
         kHVzzb2O0IS8VYc+YC5siuoXlfaviBppxX0fC/u6QEBPDoztatTP27VjoDg9irhi5S4B
         JJJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699315890; x=1699920690;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u7B09rSr5GJkw/0dQmc8mF4yG+hQAobhEyf39vTwquM=;
        b=OW1I7znMQs38+bXdjGgzKVIoCpOqzljayEFbqfDBtIm8hHnLxGrtEyQi1z2P+Y6YZ8
         Y9/Pg4cKGDALJTSSjyR2Cq2gYmw7d+7+c4BN27iNcQXEzejHcFoFs9F6th7FsLCDTqJB
         2Rov3DUdNzmhRZURVHPwV829F0Wc9YSoKyrnTqIu4yKTfWq+xlnqQU98dLuk4RP9/mIP
         7/Tya9sUgzQnpsjo6zJwV50SGlYpdTBx4aL8M7rj6UEdcCnU2Hr50oqFgGlfZKTz5XEg
         A/cbZLd0Oq73hzqaywawr1/3c18wDjoxh4mB2BVynUsl6R1S8/qJqwtrElM3RI5ltRJS
         TeAA==
X-Gm-Message-State: AOJu0YwsN1w0dsHvEQm0Ami8fdgg6d736V1cswcQH2o05jZypoVwP750
	VO9iagmdxFkduGV3/G+qYII=
X-Google-Smtp-Source: AGHT+IGrJMlHOCbcpWm2X90lUXcYyOPz2Ac8+C5VB8yvaTcCqw7r5AWnImvajZcO6HTUrg73F2RBiA==
X-Received: by 2002:a17:902:f28b:b0:1ca:8169:e853 with SMTP id k11-20020a170902f28b00b001ca8169e853mr21625676plc.4.1699315890325;
        Mon, 06 Nov 2023 16:11:30 -0800 (PST)
Received: from [192.168.0.106] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id h3-20020a170902704300b001c613091aeasm6349072plt.297.2023.11.06.16.11.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Nov 2023 16:11:29 -0800 (PST)
Message-ID: <ccf8c3df-ba3c-4546-88fb-dfd78ea974eb@gmail.com>
Date: Tue, 7 Nov 2023 07:11:26 +0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] docs: gpu: rfc: i915_scheduler.rst remove unused
 directives for namespacing
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>,
 Hunter Chasens <hunter.chasens18@ncf.edu>
Cc: corbet@lwn.net, Luca Coelho <luciano.coelho@intel.com>,
 airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20231104134708.69432-1-hunter.chasens18@ncf.edu>
 <ZUhvj2uj_PvaDxIM@debian.me> <8734xj18ck.fsf@intel.com>
 <CAFJe6O1oJnQvLVSJZP6MMXULGrX=a3SEO1X5b4xff06WhqLw_g@mail.gmail.com>
 <87edh2zn2y.fsf@intel.com>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <87edh2zn2y.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/11/2023 02:41, Jani Nikula wrote:
> On Mon, 06 Nov 2023, Hunter Chasens <hunter.chasens18@ncf.edu> wrote:
>> When running `make htmldocs` the following warnings are given.
>>
>> ```
>> Documentation/gpu/rfc/i915_scheduler.rst:138: WARNING:
>> Unknown directive type "c:namespace-push".
>>
>> .. c:namespace-push:: rfc
>> Documentation/gpu/rfc/i915_scheduler.rst:143: WARNING:
>> Unknown directive type "c:namespace-pop".
>>
>> .. c:namespace-pop::
>> ```
>>
>> The kernel test robot also reported it here.
>> Link: https://lore.kernel.org/all/202311061623.86pTQrie-lkp@intel.com/
>>
>> Last year Maryam Tahhan <mtahhan@redhat.com> from Redhat noticed something
>> similar. "The missing support of c:namespace-push:: and c:namespace-pop::
>> directives by helper scripts for kernel documentation prevents using the
>> ``c:function::`` directive with proper namespacing." From the context, it
>> sounds like this was brought about from a Sphinx update.
>>
>> Link: https://lore.kernel.org/all/20221123092321.88558-3-mtahhan@redhat.com/
>>
>> When compiled the `.. kernel-doc::` literal gives it the same formatting with
>> or without the namespace directives present. Due to the above information I
>> think it safe to remove these, as they don't seem to do anything but
>> throw warnings.
> 
> Not so fast!
> 
> Looks like this is because namespacing was introduced in Sphinx 3.1
> [1]. With earlier Sphinx, you get a warning about the namespace
> directives.
> 
> However, with newer Sphinx, you get the warning mentioned in commit
> f6757dfcfde7 ("drm/doc: fix duplicate declaration warning") if you
> remove the namespace directives:
> 
> linux/Documentation/gpu/driver-uapi.rst:2279: WARNING: Duplicate C declaration, also defined at rfc/i915_scheduler:3.
> Declaration is '.. c:struct:: i915_context_engines_parallel_submit'.
> 
> It would be short-sighted to just remove the directives. Sooner or later
> we're gong to bump the (IMO extremely conservative) minimum version
> requirement.
> 

OK, thanks for explanation!

-- 
An old man doll... just what I always wanted! - Clara

