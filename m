Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794313398;
	b=foDdiKQB4lvz8wbzipw6VIZIGKbVCyb+zTwsJ2C0NHTZz+fYI+jb1n2SapoX49p1qPau
	 PBEBQ1JkQlbLl+b1c7+3OMi9L1WHprcxxOY1EhpB08V0dmEeaCDSwes2/JKDPVeq88+v7
	 kPcV9Cr5lKl/jzKIsO6F53b5d1dh1dFfAPmSW0fn3yzynT8+OVvc39KR5HdojLtzt/mq0
	 C9Y+aC4Z1zsvj9Tt9aTq65scNwuymFlXsIVyPb/y4rNqwxepJTQFOrFm4rNp+fZcE0Wml
	 +XdMdZefSyKGttSf20LNGLwadXnGbY9e16/6xCMocB3a6pTXm8LOVYXNsHaeEVExhXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794313398;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 Content-Language:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=LiIl7kgsfTWpSgySm1Nh3N0Z7OZvnmYj+mfXUmSTco8=;
	b=H2LP1uIFX6QK5igGHdzkceTv/6Oosc5xkRmng23syRAMVf32x8EoXqMpWrq7IB+wBNxl
	 vJmFwPUCNai8dyutWe0xjLXChXLvGTJfrnz5fulFmAVz6H7L+uhhzR+sS9I6eMb5w1z/h
	 terWCJrCAcGzH6CxNqjZ5EwqiDcenn3ORck12x4MFoGru3BypyoZDI652P8i0xGJ9NPdz
	 fMTBWc5+HTYP7K/h+aM3XGOZTITHf+ZgANKKiMw0GUdpSLQHo8+2kRYNxUkU0iBJqyD3m
	 tzXzeKKJR76jdIlHTeftsZG+P7lyruqMFmbTyLsgOzTleI5YjDou0ffuORUFtHI9FAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=I49VYP+R;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ZCrZfiUt;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC910606A337
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 12:23:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC910606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=I49VYP+R;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ZCrZfiUt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794313397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LiIl7kgsfTWpSgySm1Nh3N0Z7OZvnmYj+mfXUmSTco8=;
	b=I49VYP+R/QnrD2Tw1OGXp6zkpGIiVl0KJRLKAxHT9dyECD3pNh7ocTWPR+auxetgQKVdcI
	JnQ1HUoIlI7+IS4+Ax7h0sz0Kc1KObKGnYpfL3QbBuLCgKwjzowIF1ZE5o7TBEzJ/6IM11
	zcoKW8fdW4672o/nelaV/PADietgPhM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-240-jOsFukL0P5iwQm0oEs89Yg-1; Tue, 10 Nov 2026 07:23:14 -0500
X-MC-Unique: jOsFukL0P5iwQm0oEs89Yg-1
X-Mimecast-MFC-AGG-ID: jOsFukL0P5iwQm0oEs89Yg_1794313393
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48e0461e040so1568946f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 04:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794313393; x=1794918193; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LiIl7kgsfTWpSgySm1Nh3N0Z7OZvnmYj+mfXUmSTco8=;
        b=ZCrZfiUthSZ1ovBRogJxMyo18dmg9UTkKtaU5gANdpg6AOSjlT5278I8PKTD2RSBFn
         GYQhJMDSnicbqUpOPIdMygRgg6bdojzmo33/D201kGwaGNWWu/131Vpxp15I61X0WQlr
         ypo70ThhEkcc7jL+6MS4TLnKbB0vCRmdgwM9LjdPhLcmpyYTFgTin6qBBRSlwE2rnRqt
         RfQTtd0fDRaBw4LUxZNswnS3pLCJfXUjC4hAv6JqGy+D0qMiTg3hPwUZiZ7QvASclnMf
         ldO0O7EsAvGyq6sHXYdWQxt/lzD2kJCocrurZ4SgCa/KWkZI2x6vNCbxfoK7rMxC16CJ
         bWiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794313393; x=1794918193;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LiIl7kgsfTWpSgySm1Nh3N0Z7OZvnmYj+mfXUmSTco8=;
        b=quNpPnnKfPiK9ePBqsYDxv0BICmK0d8faepVyHQkqtWvdnw7tIMrDEgaA0hHqHpx8y
         7L3mnaMYEnjQ1wU1uivYYRiijE62HFtbgNOLNguwtUjWM7MSRmDOTkxQaBEl4DIuISMc
         sbcwMoEsGmutbU6zCU6iwbz+/c6jykfMtcHUsq8nBJ5MO68RikOcf4vN8xkDo4NKFPgS
         Gs17N4Z2ltocddSnG9dHRNPhRgtdb9P8Eq2/mP7x+tR5FYRsrrh8u3OLJn+s9syvyEjK
         FJRpy7/BXkW3YRlDpQ/6SM+BaO3/McMvx8f0ZIp92STnimYspXXfxVBpcrIF0xrQ8mEB
         yRGw==
X-Forwarded-Encrypted: i=1; AL+hErFGmxq1u7xfVT2NN1hbN2q0wUdcurnwk7b4/CX95khNXw7cFh+AjUE/ORqn3zBMsETD7oWkE3WdUzE=@vger.kernel.org
X-Gm-Message-State: APuU4Z89fwvmZ9SztPLjbqi2M/39HlHNcbCvECMDYcGsVFYqWGiy4CiD
	mayvlNhSU8r28/OEErp1A2siDu1dGr+CK2CKSvoFp+hQYZdYTGbA79eNoasmVr2yWjMlT2Qz3Lk
	u+VLAttc2ZgXCVwssM4LGf9XLXdpgz9qwCF6RqGVo5SdCSAR+5ohxVH7R5bgQwA==
X-Gm-Gg: AYBFou2D20t1cm3TY5YoZ/RBH6MVoa4oflaptkqQ+ZVaO2W6R7W8mb8GTET0EfJbtee
	t2A+7/zWVNSXTntYzeG/wIUqiEhLyvVtRDeTEWD697QDgYao1kFDQlCQTBC+MIUcqNQ8fUS1Kfs
	CrPUmkQsUAuRiHpwrMDqajPPjNnHR7OBoK2EsCLD4gl9Vs77Q04E9icXd98vJ+SCC61FZG8oTZ3
	Q7IJv9DdgXFnC/NwPyJ2jAC/JpoBJO7Z00FRRmqUxnDlQ9/2E4muMo+QFpRVVf2mT5CzslFWx+v
	Ohn7zVF8rJtGoyyW9YCW4NGxYm+E7wkRhcMAo7WkuRyIEIg6DAyCPlM5HtcwRBdCt3HwHCdwB53
	n+DMdRyb9xigehJtyUj6yO1J9QbmwQDkkLbU=
X-Received: by 2002:a05:6000:310d:b0:491:45bc:d69a with SMTP id ffacd0b85a97d-49830b9797bmr5613053f8f.44.1794313392937;
        Tue, 10 Nov 2026 04:23:12 -0800 (PST)
X-Received: by 2002:a05:6000:310d:b0:491:45bc:d69a with SMTP id ffacd0b85a97d-49830b9797bmr5612980f8f.44.1794313392451;
        Tue, 10 Nov 2026 04:23:12 -0800 (PST)
Received: from [10.43.3.161] ([213.175.46.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983600bc9asm4459078f8f.29.2026.11.10.04.23.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 04:23:11 -0800 (PST)
Message-ID: <ef9829b0-845b-41bd-bf58-dd8c28baaab3@redhat.com>
Date: Tue, 10 Nov 2026 13:23:10 +0100
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
Subject: Re: [PATCH net-next 03/10] dpll: add domain object
Content-Language: en-US
To: Ivan Vecera <ivecera@redhat.com>, netdev@vger.kernel.org
Cc: Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
 Jiri Pirko <jiri@resnulli.us>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Min Li <min.li@microchip.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Richard Cochran <richardcochran@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
 Grzegorz Nitka <grzegorz.nitka@intel.com>,
 Karol Kolacinski <karol.kolacinski@intel.com>,
 Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>
References: <20261106121005.1327603-1-ivecera@redhat.com>
 <20261106121005.1327603-4-ivecera@redhat.com>
From: Petr Oros <poros@redhat.com>
In-Reply-To: <20261106121005.1327603-4-ivecera@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/6/26 1:09 PM, Ivan Vecera wrote:
> All dpll device and pin callbacks are serialized by the global dpll_lock,
> so a slow device stalls all others, whichever driver they belong to.
> 
> Add struct dpll_domain as a preparation for serializing callbacks per
> driver instance. A domain groups all devices and pins created with the
> same (module, clock_id) pair, which is in practice one chip or card. The
> same pair already identifies the owner of a pin in
> dpll_pin_own_dpll_ref_first().
> 
> Domains are kept in an xarray, like devices and pins, and they live only as
> long as their objects.
> 
> No functional change.
> 
> Signed-off-by: Ivan Vecera <ivecera@redhat.com>
> ---
>   drivers/dpll/dpll_core.c | 61 ++++++++++++++++++++++++++++++++++++++++
>   drivers/dpll/dpll_core.h | 27 ++++++++++++++++++
>   2 files changed, 88 insertions(+)
> 
> diff --git a/drivers/dpll/dpll_core.c b/drivers/dpll/dpll_core.c
> index 8389983f425695..d39c4905172f2d 100644
> --- a/drivers/dpll/dpll_core.c
> +++ b/drivers/dpll/dpll_core.c
> @@ -24,6 +24,7 @@ DEFINE_MUTEX(dpll_lock);
>   
>   DEFINE_XARRAY_FLAGS(dpll_device_xa, XA_FLAGS_ALLOC);
>   DEFINE_XARRAY_FLAGS(dpll_pin_xa, XA_FLAGS_ALLOC);
> +static DEFINE_XARRAY_FLAGS(dpll_domain_xa, XA_FLAGS_ALLOC);
>   
>   static RAW_NOTIFIER_HEAD(dpll_notifier_chain);
>   static DEFINE_IDA(dpll_pin_idx_ida);
> @@ -88,6 +89,50 @@ void dpll_pin_notify(struct dpll_pin *pin, u64 src_clock_id,
>   	call_dpll_notifiers(action, &info);
>   }
>   
> +static struct dpll_domain *dpll_domain_get(u64 clock_id, struct module *module)
> +{
> +	struct dpll_domain *domain;
> +	unsigned long i;
> +	int ret;
> +
> +	lockdep_assert_held(&dpll_lock);
> +
> +	xa_for_each(&dpll_domain_xa, i, domain) {
> +		if (domain->clock_id == clock_id && domain->module == module) {
> +			refcount_inc(&domain->refcount);
> +			return domain;
> +		}
> +	}
> +
> +	domain = kzalloc_obj(*domain);
> +	if (!domain)
> +		return ERR_PTR(-ENOMEM);
> +	domain->clock_id = clock_id;
> +	domain->module = module;
> +	refcount_set(&domain->refcount, 1);
> +	mutex_init(&domain->lock);
> +	ret = xa_alloc(&dpll_domain_xa, &domain->id, domain, xa_limit_32b,
> +		       GFP_KERNEL);
> +	if (ret) {
> +		mutex_destroy(&domain->lock);
> +		kfree(domain);
> +		return ERR_PTR(ret);
> +	}
> +
> +	return domain;
> +}
> +
> +static void dpll_domain_put(struct dpll_domain *domain)
> +{
> +	lockdep_assert_held(&dpll_lock);
> +
> +	if (refcount_dec_and_test(&domain->refcount)) {
> +		xa_erase(&dpll_domain_xa, domain->id);
> +		mutex_destroy(&domain->lock);
> +		kfree(domain);
> +	}
> +}
> +
>   static void dpll_device_tracker_alloc(struct dpll_device *dpll,
>   				      dpll_tracker *tracker)
>   {
> @@ -120,6 +165,7 @@ static void __dpll_device_put(struct dpll_device *dpll, dpll_tracker *tracker)
>   		xa_erase(&dpll_device_xa, dpll->id);
>   		WARN_ON(!list_empty(&dpll->registration_list));
>   		ref_tracker_dir_exit(&dpll->refcnt_tracker);
> +		dpll_domain_put(dpll->domain);
>   		kfree(dpll);
>   	}
>   }
> @@ -159,6 +205,7 @@ static void __dpll_pin_put(struct dpll_pin *pin, dpll_tracker *tracker)
>   		fwnode_handle_put(pin->fwnode);
>   		dpll_pin_idx_free(pin->pin_idx);
>   		ref_tracker_dir_exit(&pin->refcnt_tracker);
> +		dpll_domain_put(pin->domain);
>   		kfree_rcu(pin, rcu);
>   	}
>   }
> @@ -366,6 +413,12 @@ dpll_device_alloc(const u64 clock_id, u32 device_idx, struct module *module)
>   	dpll = kzalloc_obj(*dpll);
>   	if (!dpll)
>   		return ERR_PTR(-ENOMEM);
> +	dpll->domain = dpll_domain_get(clock_id, module);
> +	if (IS_ERR(dpll->domain)) {
> +		ret = PTR_ERR(dpll->domain);
> +		kfree(dpll);
> +		return ERR_PTR(ret);
> +	}
>   	refcount_set(&dpll->refcount, 1);
>   	INIT_LIST_HEAD(&dpll->registration_list);
>   	dpll->device_idx = device_idx;
> @@ -374,6 +427,7 @@ dpll_device_alloc(const u64 clock_id, u32 device_idx, struct module *module)
>   	ret = xa_alloc_cyclic(&dpll_device_xa, &dpll->id, dpll, xa_limit_32b,
>   			      &dpll_device_xa_id, GFP_KERNEL);
>   	if (ret < 0) {
> +		dpll_domain_put(dpll->domain);
>   		kfree(dpll);
>   		return ERR_PTR(ret);
>   	}
> @@ -664,6 +718,11 @@ dpll_pin_alloc(u64 clock_id, u32 pin_idx, struct module *module,
>   	ret = dpll_pin_prop_dup(prop, &pin->prop);
>   	if (ret)
>   		goto err_pin_prop;
> +	pin->domain = dpll_domain_get(clock_id, module);
> +	if (IS_ERR(pin->domain)) {
> +		ret = PTR_ERR(pin->domain);
> +		goto err_domain;
> +	}
>   	refcount_set(&pin->refcount, 1);
>   	xa_init_flags(&pin->dpll_refs, XA_FLAGS_ALLOC);
>   	xa_init_flags(&pin->parent_refs, XA_FLAGS_ALLOC);
> @@ -678,6 +737,8 @@ dpll_pin_alloc(u64 clock_id, u32 pin_idx, struct module *module,
>   	xa_destroy(&pin->dpll_refs);
>   	xa_destroy(&pin->parent_refs);
>   	xa_destroy(&pin->ref_sync_pins);
> +	dpll_domain_put(pin->domain);
> +err_domain:
>   	dpll_pin_prop_free(&pin->prop);
>   err_pin_prop:
>   	kfree(pin);
> diff --git a/drivers/dpll/dpll_core.h b/drivers/dpll/dpll_core.h
> index da8a369556ed11..6705e81bc11de9 100644
> --- a/drivers/dpll/dpll_core.h
> +++ b/drivers/dpll/dpll_core.h
> @@ -9,18 +9,42 @@
>   
>   #include <linux/dpll.h>
>   #include <linux/list.h>
> +#include <linux/mutex.h>
>   #include <linux/refcount.h>
>   #include <linux/ref_tracker.h>
>   #include "dpll_nl.h"
>   
>   #define DPLL_REGISTERED		XA_MARK_1
>   
> +/**
> + * struct dpll_domain - group of dpll objects sharing a lock
> + * @id:			index of the domain in dpll_domain_xa
> + * @clock_id:		clock_id of the objects in the domain
> + * @module:		module of the objects in the domain
> + * @refcount:		number of dpll devices and pins in the domain
> + * @lock:		lock of the domain
> + *
> + * All dpll devices and pins created with the same (module, clock_id) pair
> + * belong to one domain, in practice to one chip or card.
> + **/
> +struct dpll_domain {
> +	u32 id;
> +	u64 clock_id;
> +	struct module *module;
> +	refcount_t refcount;
> +	/* Serializes the driver callbacks of all DPLL devices and pins
> +	 * that share one (module, clock_id) pair.
> +	 */
> +	struct mutex lock;
> +};
> +
>   /**
>    * struct dpll_device - stores DPLL device internal data
>    * @id:			unique id number for device given by dpll subsystem
>    * @device_idx:		id given by dev driver
>    * @clock_id:		unique identifier (clock_id) of a dpll
>    * @module:		module of creator
> + * @domain:		domain the device belongs to
>    * @type:		type of a dpll
>    * @pin_refs:		stores pins registered within a dpll
>    * @refcount:		refcount
> @@ -32,6 +56,7 @@ struct dpll_device {
>   	u32 device_idx;
>   	u64 clock_id;
>   	struct module *module;
> +	struct dpll_domain *domain;
>   	enum dpll_type type;
>   	struct xarray pin_refs;
>   	refcount_t refcount;
> @@ -46,6 +71,7 @@ struct dpll_device {
>    * @clock_id:		clock_id of creator
>    * @module:		module of creator
>    * @module_name:	module name of creator
> + * @domain:		domain the pin belongs to
>    * @fwnode:		optional reference to firmware node
>    * @dpll_refs:		hold referencees to dplls pin was registered with
>    * @parent_refs:	hold references to parent pins pin was registered with
> @@ -61,6 +87,7 @@ struct dpll_pin {
>   	u64 clock_id;
>   	struct module *module;
>   	char module_name[MODULE_NAME_LEN];
> +	struct dpll_domain *domain;
>   	struct fwnode_handle *fwnode;
>   	struct xarray dpll_refs;
>   	struct xarray parent_refs;

Reviewed-by: Petr Oros <poros@redhat.com>

