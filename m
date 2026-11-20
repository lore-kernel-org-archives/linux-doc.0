Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795188702;
	b=Rj+q9eqKMElEZgQl/PBflLY/tqPHr/Bgy84jrMyN5Jf+flqgTizcqS0ivbx1Kxx0gHcy
	 Qqm2sW320pE10RvAG/K4eD6gm+dczUPUGwV2jyUNv/8iD4Smo5bHwMbz3KJDmOJTC5ebd
	 LRiJxSZBHKA+GGik6jpJZHD1DqyyH1aB1LuqkE+BrHvH9JCAx/LnKxJQH4RfZiDQOf3BK
	 dvbkdHpi4QW9i6+aG100jk1AQG58zDTfwrNMrxvmmxafMcTinwVu48zJS0cQHmeue1FYD
	 2hjqTIxw959gLxMxhpth6sHb/JSRFzYfafYe0DayjTmiQqFjCftd2Md+Uc1EbjUP8bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795188702;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=EkXZISUgyp8P5fx5QB4QsAetPzLwfV+83m+18GaFq90=;
	b=3DmGRIVti0tzVYqXXN1ugsEmNEtgSw8Uq37G12aaUT2eORsfFzpmMGmG8ceirA0GMa+F
	 j7V8GJ6eF40Or1xl7aYI1tNt3J1NbxjamZRV8m+5xHb/pDnPjDqx5WlszePtnmcg6oVS0
	 kg+7FCDjKzL41QCLLC8sn6nY0fVWX0PePZJ3BxNNM9PgETZkSX6SJEFFNcGU4FUTpHl+7
	 qjCBZARpnu/HPydY10wjFcBLpASoKdp+6vAbP0BNvXEYVv6S25z19dMgergScg+wRpKag
	 sBBabT9sfYcaEe3cJ/utJDW+pbITN8CxH4k6++IssofDkwF+q3Kfz7ZqUtbdCRZwmLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=HglWu6Dc;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440AD606A320;
	Fri, 20 Nov 2026 15:31:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 440AD606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=HglWu6Dc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=EkXZISUgyp8P5fx5QB4QsAetPzLwfV+83m+18GaFq90=; t=1795188700; x=2110548700; 
	b=HglWu6DcEALuAqRXs5aRc4CUuYqWW9az5n4oQoyPM+kdllVauHxPvPn+gZpzM/CvA7jVgUnh8Uj
	o7RjBUTyOWSWVejDklHE+cJ/NsVEVKD6HSYQevS84HOHXDxEjhjt74RZKs5kq774c3KaO6E+mtcPf
	DYPtolqqz8L7of8lWVF68Io62X56+MA+g9h3wHMPUTgA+4dPzwPHV1eKq5RK82w7a/KdZQI59XLjk
	5JnmA4KJbVIn+sqxszxOmFJzyo2TxyNoWZD7IT3F97v/DbS91b0x+pGlp9hjaLz4k/MR5p6aEB0Qy
	W7Wa+M+0CgYbB8gTBMA5hbbyqGm7YHN6L5fA==;
Received: from [179.105.94.163] (helo=[192.168.0.4])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1xUQaB-00000001vSC-0jax;
	Fri, 20 Nov 2026 16:31:23 +0100
Message-ID: <c2c39d36-70ec-4623-9d21-639622cef80a@igalia.com>
Date: Fri, 20 Nov 2026 12:31:17 -0300
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
Subject: Re: [PATCH v6 0/2] accel/rocket: Report NPU usage through fdinfo
To: Sidong Yang <sidong.yang@furiosa.ai>, Tomeu Vizoso
 <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>,
 Philipp Stanner <phasta@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>, ckoenig.leichtzumerken@gmail.com
Cc: Tvrtko Ursulin <tursulin@ursulin.net>, Heiko Stuebner <heiko@sntech.de>,
 Gyeyoung Baek <gye976@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261120141225.789350-1-sidong.yang@furiosa.ai>
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Content-Language: en-US
Autocrypt: addr=mcanal@igalia.com; keydata=
 xsBNBGcCwywBCADgTji02Sv9zjHo26LXKdCaumcSWglfnJ93rwOCNkHfPIBll85LL9G0J7H8
 /PmEL9y0LPo9/B3fhIpbD8VhSy9Sqz8qVl1oeqSe/rh3M+GceZbFUPpMSk5pNY9wr5raZ63d
 gJc1cs8XBhuj1EzeE8qbP6JAmsL+NMEmtkkNPfjhX14yqzHDVSqmAFEsh4Vmw6oaTMXvwQ40
 SkFjtl3sr20y07cJMDe++tFet2fsfKqQNxwiGBZJsjEMO2T+mW7DuV2pKHr9aifWjABY5EPw
 G7qbrh+hXgfT+njAVg5+BcLz7w9Ju/7iwDMiIY1hx64Ogrpwykj9bXav35GKobicCAwHABEB
 AAHNIE1hw61yYSBDYW5hbCA8bWNhbmFsQGlnYWxpYS5jb20+wsCRBBMBCAA7FiEE+ORdfQEW
 dwcppnfRP/MOinaI+qoFAmcCwywCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQ
 P/MOinaI+qoUBQgAqz2gzUP7K3EBI24+a5FwFlruQGtim85GAJZXToBtzsfGLLVUSCL3aF/5
 O335Bh6ViSBgxmowIwVJlS/e+L95CkTGzIIMHgyUZfNefR2L3aZA6cgc9z8cfow62Wu8eXnq
 GM/+WWvrFQb/dBKKuohfBlpThqDWXxhozazCcJYYHradIuOM8zyMtCLDYwPW7Vqmewa+w994
 7Lo4CgOhUXVI2jJSBq3sgHEPxiUBOGxvOt1YBg7H9C37BeZYZxFmU8vh7fbOsvhx7Aqu5xV7
 FG+1ZMfDkv+PixCuGtR5yPPaqU2XdjDC/9mlRWWQTPzg74RLEw5sz/tIHQPPm6ROCACFls7A
 TQRnAsMsAQgAxTU8dnqzK6vgODTCW2A6SAzcvKztxae4YjRwN1SuGhJR2isJgQHoOH6oCItW
 Xc1CGAWnci6doh1DJvbbB7uvkQlbeNxeIz0OzHSiB+pb1ssuT31Hz6QZFbX4q+crregPIhr+
 0xeDi6Mtu+paYprI7USGFFjDUvJUf36kK0yuF2XUOBlF0beCQ7Jhc+UoI9Akmvl4sHUrZJzX
 LMeajARnSBXTcig6h6/NFVkr1mi1uuZfIRNCkxCE8QRYebZLSWxBVr3h7dtOUkq2CzL2kRCK
 T2rKkmYrvBJTqSvfK3Ba7QrDg3szEe+fENpL3gHtH6h/XQF92EOulm5S5o0I+ceREwARAQAB
 wsB2BBgBCAAgFiEE+ORdfQEWdwcppnfRP/MOinaI+qoFAmcCwywCGwwACgkQP/MOinaI+qpI
 zQf+NAcNDBXWHGA3lgvYvOU31+ik9bb30xZ7IqK9MIi6TpZqL7cxNwZ+FAK2GbUWhy+/gPkX
 it2gCAJsjo/QEKJi7Zh8IgHN+jfim942QZOkU+p/YEcvqBvXa0zqW0sYfyAxkrf/OZfTnNNE
 Tr+uBKNaQGO2vkn5AX5l8zMl9LCH3/Ieaboni35qEhoD/aM0Kpf93PhCvJGbD4n1DnRhrxm1
 uEdQ6HUjWghEjC+Jh9xUvJco2tUTepw4OwuPxOvtuPTUa1kgixYyG1Jck/67reJzMigeuYFt
 raV3P8t/6cmtawVjurhnCDuURyhUrjpRhgFp+lW8OGr6pepHol/WFIOQEg==
In-Reply-To: <20261120141225.789350-1-sidong.yang@furiosa.ai>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Sidong,

On 20/11/26 11:12, Sidong Yang wrote:
> Report how much of the NPU each client uses through fdinfo. Patch 1
> exports the runtime the scheduler already accounts per entity, and patch
> 2 uses it for rocket's drm-engine-npu key.
> 
> v6: Rename the getter to drm_sched_entity_get_runtime_ns() (Maíra
>      Canal). Report rdev->num_cores, the cores that are bound, as the
>      capacity instead of rdev->max_cores, and skip the key once no core
>      is left as a capacity of zero is not allowed (Maíra Canal). Add
>      tags.
> v5: Use the entity runtime from the new drm_sched_entity_get_runtime()
>      instead of a counter in rocket (Tvrtko Ursulin). Reviewed-by tags
>      are not carried as the accounting changed. Based on drm-misc-next.
> v4: Single drm-engine-npu key with drm-engine-capacity-npu, and
>      documentation (Tomeu Vizoso).
> v3: Add a rocket_engine_usage_create() helper (Gyeyoung Baek).
> v2: Size the per-core counters by rdev->max_cores.

For both patches,

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Best regards,
- Maíra

> 
> Link to v5: https://lore.kernel.org/all/20261112171144.3151554-1-sidong.yang@furiosa.ai/
> Link to v4: https://lore.kernel.org/all/20261103155338.1949294-1-sidong.yang@furiosa.ai/
> Link to v3: https://lore.kernel.org/all/20261103104804.1887489-1-sidong.yang@furiosa.ai/
> Link to v2: https://lore.kernel.org/all/20261101152723.1430312-1-sidong.yang@furiosa.ai/
> Link to v1: https://lore.kernel.org/all/20261031083642.1076356-1-sidong.yang@furiosa.ai/
> 
> Sidong Yang (2):
>    drm/sched: Add drm_sched_entity_get_runtime_ns()
>    accel/rocket: Report NPU usage through fdinfo
> 
>   Documentation/accel/rocket/index.rst     | 29 ++++++++++++++++++++++++
>   Documentation/gpu/drm-usage-stats.rst    |  1 +
>   drivers/accel/rocket/rocket_drv.c        | 25 +++++++++++++++++++-
>   drivers/gpu/drm/scheduler/sched_entity.c | 25 ++++++++++++++++++++
>   include/drm/gpu_scheduler.h              |  1 +
>   5 files changed, 80 insertions(+), 1 deletion(-)
> 
> 
> base-commit: c408466a4dfaee4b12587e926c5b85e68c8b3c40

