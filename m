Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BknhSvk1"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96551194
	for <linux-doc@vger.kernel.org>; Mon, 27 Nov 2023 11:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701114895;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+viejdGrXzmIzPjCsTE2dERIUwjgFpRXidRJ+El7Zb0=;
	b=BknhSvk1bgLbumk0hFUIZx6/dCZScvUq0ppNkgOP8+Kjoa4UndPU5ibEyDauHailES6FqK
	zJchlVl8npR7LM1NoLOr4AQzEmi8kZbyWDg17xMlGfToc82Xz5J9nkE543bFXSFVNLGvdk
	7IHLQnNLpU3z4TdjLAzZUiiPuV7qc1k=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-128-nSROuJLNOyGFeE4gqVO_ww-1; Mon, 27 Nov 2023 14:54:54 -0500
X-MC-Unique: nSROuJLNOyGFeE4gqVO_ww-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a02b9c28a08so356365066b.0
        for <linux-doc@vger.kernel.org>; Mon, 27 Nov 2023 11:54:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701114893; x=1701719693;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+viejdGrXzmIzPjCsTE2dERIUwjgFpRXidRJ+El7Zb0=;
        b=KgQqAMV9FAdVyaHlvlQwuUN1KTv7VwkUpzvs99+0HdI/1qGAkypdrElgsWaiAHMqIp
         fMKQoOG+Uq9MRKxk6+ajZaYK0Hjb7jzSJA2gkNnUW8li6efv7Xu+OUaCmsKJef6ksv8Q
         FGcwaKa8xBM0u+9WqAtdZneqBIgSTxhTWBhjBL4uQEyked7FMspQNAN1Aur9CxWlugVQ
         UV76xTKnSsesNAFcQWgIf0dox/OmOs27/TmPm3i/7+OTqibI9L2cC7OpRS+8E4LODvxV
         BzBmIb570g/X3avBfwQFPJ1xvJHo1DrUvK4X7NF0FHmgXk2keJJ3XDORF72kGBTHIuP4
         6XTg==
X-Gm-Message-State: AOJu0YwXe/pM+CQXYCfvgzcO3QBDgcuSouOAlC2UYDU6Jo4govC4Msbi
	8ZVGPx2gick+LQIjRVZ3zFrmW8iuDAmKoOGpq4Th1H+JZOfEFdps/NnKa973XVaV26GrensU4se
	hLkVH/1tgfaPTfry6ip3d
X-Received: by 2002:a17:907:c708:b0:9b2:d78c:afe9 with SMTP id ty8-20020a170907c70800b009b2d78cafe9mr12510217ejc.49.1701114893230;
        Mon, 27 Nov 2023 11:54:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEqsjQCsAPoPOd6g0Qn1BKTS65cz8ECHJlGNLkABKEDrEEApBu5Jji0dCbisefe04GfKIqPgw==
X-Received: by 2002:a17:907:c708:b0:9b2:d78c:afe9 with SMTP id ty8-20020a170907c70800b009b2d78cafe9mr12510207ejc.49.1701114892974;
        Mon, 27 Nov 2023 11:54:52 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de9c:abf:b8ff:feee:998b? ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id e27-20020a1709062c1b00b009fda627abd9sm5988845ejh.79.2023.11.27.11.54.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Nov 2023 11:54:52 -0800 (PST)
Message-ID: <6a30b834-fa29-41aa-bf91-4ab887dc2a56@redhat.com>
Date: Mon, 27 Nov 2023 20:54:51 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] Documentation/gpu: VM_BIND locking document
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Oak Zeng <oak.zeng@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20231121104046.3201-1-thomas.hellstrom@linux.intel.com>
 <20231121145619.7e7cb541@collabora.com>
 <574ec6bd-22ff-ec66-0bfe-35b51b7142f6@linux.intel.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <574ec6bd-22ff-ec66-0bfe-35b51b7142f6@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/22/23 08:49, Thomas Hellström wrote:
> 
> On 11/21/23 14:56, Boris Brezillon wrote:
>> On Tue, 21 Nov 2023 11:40:46 +0100
>> Thomas Hellström <thomas.hellstrom@linux.intel.com> wrote:
>>
>>> Add the first version of the VM_BIND locking document which is
>>> intended to be part of the xe driver upstreaming agreement.
>>>
>>> The document describes and discuss the locking used during exec-
>>> functions, evicton and for userptr gpu-vmas. Intention is to be using the
>>> same nomenclature as the drm-vm-bind-async.rst.
>>>
>>> v2:
>>> - s/gvm/gpu_vm/g (Rodrigo Vivi)
>>> - Clarify the userptr seqlock with a pointer to mm/mmu_notifier.c
>>>    (Rodrigo Vivi)
>>> - Adjust commit message accordingly.
>>> - Add SPDX license header.
>>>
>>> v3:
>>> - Large update to align with the drm_gpuvm manager locking
>>> - Add "Efficient userptr gpu_vma exec function iteration" section
>>> - Add "Locking at bind- and unbind time" section.
>>>
>>> v4:
>>> - Fix tabs vs space errors by untabifying (Rodrigo Vivi)
>>> - Minor style fixes and typos (Rodrigo Vivi)
>>> - Clarify situations where stale GPU mappings are occurring and how
>>>    access through these mappings are blocked. (Rodrigo Vivi)
>>> - Insert into the toctree in implementation_guidelines.rst
>>>
>>> v5:
>>> - Add a section about recoverable page-faults.
>>> - Use local references to other documentation where possible
>>>    (Bagas Sanjaya)
>>> - General documentation fixes and typos (Danilo Krummrich and
>>>    Boris Brezillon)
>>> - Improve the documentation around locks that need to be grabbed from the
>>>    dm-fence critical section (Boris Brezillon)
>>> - Add more references to the DRM GPUVM helpers (Danilo Krummrich and
>>>    Boriz Brezillon)
>>> - Update the rfc/xe.rst document.
>>>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Still have a few comments (see below), and in general, I find some
>> sentences very long, which has the tendency of confusing me (always
>> trying to figure out what was the main point, what the pronouns are
>> referring to, etc). Anyway, I think it's better to have something
>> imperfect than nothing at all, so here is my
>>
>> Reviewed-by: Boris Brezillon <boris.brezillon@collabora>
>>
>> Feel free to add it even if you decide to ignore my comments.
> 
> Thanks for reviewing, Boris!
> 
> I'll make a final version incorporating much of the comments and suggestions, much appreciated.
> 
> I still think, though, that in principle the referral between gpuvm and this document should be the other way around, or it should all sit in gpuvm. In any case this is an initial version and as more comments and suggestions land, we can certainly update.

I think if we agree that GPUVM should be the common component that we recommend
drivers to use, we should reference to GPUVM whenever possible. However, I'm not
sure whether we'd want to dedicate *all* documentation to GPUVM. Since the topic
is rather complex, I can see that it might be beneficial to do both, discuss it
from a more abstract point of view and document the corresponding common component.

Reviewed-by: Danilo Krummrich <dakr@redhat.com>

> 
> Thanks,
> 
> Thomas
> 

