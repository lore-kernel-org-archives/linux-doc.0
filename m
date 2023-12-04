Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aS0j2EDw"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3830D109
	for <linux-doc@vger.kernel.org>; Mon,  4 Dec 2023 05:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701694834;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FriHzOMQp/2DueNm6yNB4UNP5qaRQJmWiziJsVzEw8g=;
	b=aS0j2EDwoSHNL5nbtEsl2nJRR1QQMrSO71JDwUz45Lz+4Y5YXTvTSI2E2lqvetIa9RzEKV
	hJKCGGq63g6NWzHFQoISjnWymTcOMc/ftX/kQNB+eY5k8weio8cNiv/uEQS08v6xVDIWJC
	XBpA0BQfOZ2ePXfRWvH/JpuFvzkIELc=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-332-VIqa8LJnOyWr7NU5kQPSzA-1; Mon, 04 Dec 2023 08:00:33 -0500
X-MC-Unique: VIqa8LJnOyWr7NU5kQPSzA-1
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2c9c217cfdeso47428621fa.1
        for <linux-doc@vger.kernel.org>; Mon, 04 Dec 2023 05:00:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701694832; x=1702299632;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FriHzOMQp/2DueNm6yNB4UNP5qaRQJmWiziJsVzEw8g=;
        b=izZCZFWS4eBs2zt/SNe5gph2RULWdIvxEvhqw3BnSzZ6OXVYTfvau5e2uxs972cQ3i
         Qh5OqMAXp7vkFzjI5kAwPEdP7CCF0aCkXwX9Qa2F11GDw4e/1u7tsA8L0nrEeqV038lw
         RkqvANX369MUNedNQngb/44m4nwWq1h+SQsClyND18ICGg4m01SCKaxkXZpjtEgiidg2
         0+HHCaT29HjWP8wso49wlpsorUfzdCIwPgw8APM7BOXXclkpSjCwRdXjb8/3BjaTJNVV
         c5qA4f53p/xHFapmioNoorC7G8PjscJo754yLYcZYWHJpfmvway8Pvh5fgTrX186KRmg
         O4EA==
X-Gm-Message-State: AOJu0YyJXZJ8e6cjdRtGLbdLQYP1ZHHatirRIqzUX48HeuxIqvyBGMQK
	T1QIFraxmEDoNsU0h8a/kw3E69vPGlmfHiONWX0y/nlWPHZXp2YQAXQtxc40N64gYy2pVb0u7rs
	hJBtOj1vGxn+uQIB1zRwt
X-Received: by 2002:a2e:7815:0:b0:2ca:960:ecf with SMTP id t21-20020a2e7815000000b002ca09600ecfmr407460ljc.38.1701694831768;
        Mon, 04 Dec 2023 05:00:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEUDlL3PQDaunfbKm5bm9nZExcQclP036JU8t7gUe6hkMIGG85ZkiV9yFlmISmoVd9Fx18tFQ==
X-Received: by 2002:a2e:7815:0:b0:2ca:960:ecf with SMTP id t21-20020a2e7815000000b002ca09600ecfmr407450ljc.38.1701694831370;
        Mon, 04 Dec 2023 05:00:31 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id p7-20020a17090635c700b009fc576e26e6sm5238674ejb.80.2023.12.04.05.00.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Dec 2023 05:00:30 -0800 (PST)
Message-ID: <99de0223-6d28-4379-ac2a-ef093ee0386c@redhat.com>
Date: Mon, 4 Dec 2023 14:00:29 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 2/9] platform/x86/amd: Add support for AMD ACPI based
 Wifi band RFI mitigation feature
Content-Language: en-US
To: Ma Jun <Jun.Ma2@amd.com>, amd-gfx@lists.freedesktop.org, lenb@kernel.org,
 johannes@sipsolutions.net, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, alexander.deucher@amd.com,
 Lijo.Lazar@amd.com, mario.limonciello@amd.com, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc: majun@amd.com, Evan Quan <quanliangl@hotmail.com>
References: <20231129091348.3972539-1-Jun.Ma2@amd.com>
 <20231129091348.3972539-3-Jun.Ma2@amd.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231129091348.3972539-3-Jun.Ma2@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11/29/23 10:13, Ma Jun wrote:
> Due to electrical and mechanical constraints in certain platform designs
> there may be likely interference of relatively high-powered harmonics of
> the (G-)DDR memory clocks with local radio module frequency bands used
> by Wifi 6/6e/7.
> 
> To mitigate this, AMD has introduced a mechanism that devices can use to
> notify active use of particular frequencies so that other devices can make
> relative internal adjustments as necessary to avoid this resonance.
> 
> Co-developed-by: Evan Quan <quanliangl@hotmail.com>
> Signed-off-by: Evan Quan <quanliangl@hotmail.com>
> Signed-off-by: Ma Jun <Jun.Ma2@amd.com>
> 
> --
> v11:
>  - fix typo(Simon)
> v12:
>  - Fix the code logic (Rafael)
>  - Move amd_wbrf.c to drivers/platform/x86/amd/wbrf.c
>  - Updated Evan's email because he's no longer at AMD.Thanks
> for his work in earlier versions.
> v13:
>  - Fix the format issue (IIpo Jarvinen)
>  - Add comment for some functions
> v14:
>  - Use the apci_check_dsm and acpi_evaluate_dsm (Hans de Goede)

Thank you this is much better.

I notice that the #define ACPI_AMD_WBRF_METHOD	"\\WBRF"
still exists though and that this is still used in
static bool acpi_amd_wbrf_supported_system(void).

I think it might be better to just remove
these 2 all together.

Checking if a DSM with the expected GUID is present
and if that has the correct bits set in its supported
mask should be enough.

And on future systems the implementer may decide to
not have a WBRF helper function at all and instead
handle everything in the _DSM method.

So the "\\WBRF" check seems to be checking for
what really is an implementation detail.

2 other very small remarks:

> +/**
> + * acpi_amd_wbrf_supported_producer - determine if the WBRF can be enabled
> + *                                    for the device as a producer
> + *
> + * @dev: device pointer
> + *
> + * Check if the platform equipped with necessary implementations to
> + * support WBRF for the device as a producer.
> + *
> + * Return:
> + * true if WBRF is supported, otherwise returns false
> + */
> +bool acpi_amd_wbrf_supported_producer(struct device *dev)
> +{
> +	struct acpi_device *adev;
> +
> +	adev = ACPI_COMPANION(dev);
> +	if (!adev)
> +		return false;
> +
> +	if (!acpi_amd_wbrf_supported_system())
> +		return false;
> +
> +
> +	return acpi_check_dsm(adev->handle, &wifi_acpi_dsm_guid,
> +			      WBRF_REVISION, BIT(WBRF_RECORD));
> +}
> +EXPORT_SYMBOL_GPL(acpi_amd_wbrf_supported_producer);

Please don't use double empty lines, one empty line to separate things
is enough.

> +
> +/**
> + * acpi_amd_wbrf_supported_consumer - determine if the WBRF can be enabled
> + *                                    for the device as a consumer
> + *
> + * @dev: device pointer
> + *
> + * Determine if the platform equipped with necessary implementations to
> + * support WBRF for the device as a consumer.
> + *
> + * Return:
> + * true if WBRF is supported, otherwise returns false.
> + */
> +bool acpi_amd_wbrf_supported_consumer(struct device *dev)
> +{
> +	struct acpi_device *adev;
> +
> +	adev = ACPI_COMPANION(dev);
> +	if (!adev)
> +		return false;
> +
> +	if (!acpi_amd_wbrf_supported_system())
> +		return false;
> +
> +	return acpi_check_dsm(adev->handle, &wifi_acpi_dsm_guid,
> +			      WBRF_REVISION, BIT(WBRF_RETRIEVE));
> +}
> +EXPORT_SYMBOL_GPL(acpi_amd_wbrf_supported_consumer);
> +
> +/**
> + * amd_wbrf_retrieve_freq_band - retrieve current active frequency
> + *                                     bands

You may go a bit over the 80 chars limit, please just make this
a single line:

 * amd_wbrf_retrieve_freq_band - retrieve current active frequency bands

> + *
> + * @dev: device pointer
> + * @out: output structure containing all the active frequency bands
> + *
> + * Retrieve the current active frequency bands which were broadcasted
> + * by other producers. The consumer who calls this API should take
> + * proper actions if any of the frequency band may cause RFI with its
> + * own frequency band used.
> + *
> + * Return:
> + * 0 for getting wifi freq band successfully.
> + * Returns a negative error code for failure.
> + */

Regards,

Hans

