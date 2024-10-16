Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B5E206041
	for <linux-doc@vger.kernel.org>; Wed, 16 Oct 2024 09:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729072792; cv=none; b=Zm8RGDNKle2KvNkFjplzCXy2uhWblfXWPhCF06moKcCe6bv5NQaGJH1kvI9Ig7UWylm++WQOQYbXOitqXLg2REZH3vC3V6Ri2F4j5DnTuhCJqm206/Ypqs1BT8sQpMWffpCd7zUhqnhGQBPwrY3Yk8i6HwSFRsn7Db83dX2ZJx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729072792; c=relaxed/simple;
	bh=2XC6R4guj5S2LQ3efLjxy0pDXaC+7A8Y4fP4r0jXNJs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Eeuv9xQ0Yp0/Yn1pOXhqkkyD0DZaI7pIw0IkiPUlgO7nsGFk3ObzRWVcAdwCx1sy6fHohcL3wyAM/mGt+z6Divq6WfHZ8KIiLEtEIHGfdMeiy015eoNkwgsUTzdBvnjRfOfuQ4e9tV26LETYtuZxKEslWY5ane/CtYxVM+zVfo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cPnGgcWs; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cPnGgcWs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729072790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=klkIURfPfIeZWqtniUUVslo0WqVi18vzVEHDUiCNehs=;
	b=cPnGgcWszhfDyxrOZ7ImIYRpGBuwbTAPa/R/2TsuEwVog+9HZOnDkCYwAI0+kPHrxGB5Wv
	c7g9DH/G6CNbT/we93YcEkgJ/Vtf5vcp1G8x5QJjGYxPs5LObNdavYAxoXrsjINjyRXfJp
	blUmHrxG9VwMcgdj00FnXCvFW5jp+I0=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-435-NPZtJV3gOiO_gBIxGlv5UA-1; Wed, 16 Oct 2024 05:59:48 -0400
X-MC-Unique: NPZtJV3gOiO_gBIxGlv5UA-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-539eeb63cc3so2758873e87.2
        for <linux-doc@vger.kernel.org>; Wed, 16 Oct 2024 02:59:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729072787; x=1729677587;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=klkIURfPfIeZWqtniUUVslo0WqVi18vzVEHDUiCNehs=;
        b=g0bEWXhsDlbUyVNJDFy0aCJcEn2XemImETjIEUupUe++TPvfQxwp9bPnsdRQHNp6Lg
         c243o3YkqCn3o+j0xxIV9zS5qm+N9qg0A491AoxoNn4TWQB8hfNIv6rabprOXJG1R5K/
         c2MalWxorfD5oqw73Re7UPxA6j895cGUby/rL1KBICuJCqm6bkc5HkHyEy2DywSHM9bI
         JeyQQVovmC2o+jTVG7A4uIFgHefnY3bt07d1f5dL9HTQ9GKjkSL5VE4JuPG8OM4xNfI2
         rPptFXUjd63eLhV/DznxZXxaIWAl0vvrGGtGN3GtTtT9mdyiU8jP3254a3Orgvyt/21t
         HVGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpZvuvps0ivvUFdIB33cEmUvkcVWIWk5UVaKkCi6sa1CUqBpWgjvtuj8Q9uauuxnG1bFj+6rW6xqI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyW6RScrSz94PUe3NsmSwMTMYDk7WvmJ2q8AEGs4e8B5wPTlwug
	dYQC7wTMUH0ozgqjBXW/AjkVzg0z8X1uXSs4uk/NksaK1Dk9pmN4ieoF1nD21WJenZfN/5QGgNQ
	TFYtyFi6fQ73lA2eMcA2GQawpsG4SPIOhdY+LpDFn7ARrMw/S0iKdy+6fsQ==
X-Received: by 2002:a05:6512:2245:b0:539:f7de:df6a with SMTP id 2adb3069b0e04-539f7dee23amr5447501e87.52.1729072787290;
        Wed, 16 Oct 2024 02:59:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFekB89aRCErYZDVnkCQyydN+Q4Cis1HQZOYg9npYTESVjqq1XcbpghIXt6aIaMbsNL8W0r7Q==
X-Received: by 2002:a05:6512:2245:b0:539:f7de:df6a with SMTP id 2adb3069b0e04-539f7dee23amr5447479e87.52.1729072786837;
        Wed, 16 Oct 2024 02:59:46 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c98d4d710csm1545673a12.10.2024.10.16.02.59.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Oct 2024 02:59:45 -0700 (PDT)
Message-ID: <e385eea0-694d-47d7-9eab-0c2dcda9b0f4@redhat.com>
Date: Wed, 16 Oct 2024 11:59:44 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/13] platform/x86: hfi: Introduce AMD Hardware
 Feedback Interface Driver
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Cc: Borislav Petkov <bp@alien8.de>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 x86@kernel.org, "Gautham R . Shenoy" <gautham.shenoy@amd.com>,
 Perry Yuan <perry.yuan@amd.com>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-pm@vger.kernel.org,
 platform-driver-x86@vger.kernel.org,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
References: <20241010193705.10362-1-mario.limonciello@amd.com>
 <20241010193705.10362-6-mario.limonciello@amd.com>
 <4gcjfysohl7qxdfgmxm6j4yd5ps67qpnnwgt776xondsfdwnri@7mde6vfyfiah>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <4gcjfysohl7qxdfgmxm6j4yd5ps67qpnnwgt776xondsfdwnri@7mde6vfyfiah>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 16-Oct-24 11:36 AM, Uwe Kleine-König wrote:
> Hello,
> 
> On Thu, Oct 10, 2024 at 02:36:57PM -0500, Mario Limonciello wrote:
>> +static struct platform_driver amd_hfi_driver = {
>> +	.driver = {
>> +		.name = AMD_HFI_DRIVER,
>> +		.owner = THIS_MODULE,
>> +		.acpi_match_table = ACPI_PTR(amd_hfi_platform_match),
>> +	},
>> +	.probe = amd_hfi_probe,
>> +	.remove_new = amd_hfi_remove,
>> +};
> 
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers. Please just drop "_new".

Note there is a "[v3,05/14] platform/x86: hfi: Introduce AMD Hardware
Feedback Interface Driver" patch superseding this one now; and that one
has the same issue.

Regards,

Hans

