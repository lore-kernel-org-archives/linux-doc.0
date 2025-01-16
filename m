Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B154F158868
	for <linux-doc@vger.kernel.org>; Thu, 16 Jan 2025 07:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737012966; cv=none; b=UTizq6iQGTSzrbJdb2MSRG0+U+JaOc39AqbWjzzNqGHFco0+BklQqeQQQvvfTFs4ZJVL+aMbFOePFwSKTAJHahiN2xJMaZZkrHpaWLYqvPBJJUPFOekAh8Oex6Ac2G3MZ739PSDTQ86wN23Z9xxWN9/psvsZebs9A+1GXJPd96s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737012966; c=relaxed/simple;
	bh=VoeXlQk0YZkZEx3M+5T3QtYjmi+/6qjWExFods354P8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S32BN/vup3KzpBv7BcswotVDAfsdu4wfQx9CsJdqrF5l6mrd6H4M8+mIIAjBqmGk/ht5am4km0fXomWMeDnzygNUIrEVg785BvFOOCuLlCbe0BiMosO/XPJwPaaYBlmn2atu9E55hHSfEfqJGMxcFk9l142AaUe+g00EiZ7QrC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=W6O18M2/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W6O18M2/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737012963;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Eui++kz06c5Zm0ps9MJyTagiDgf7HwZZozSXkY68zTU=;
	b=W6O18M2/U6xU3UgIOhDWpL0pBs8k6/g9+6+GEgM4e7IEuajXsaOJA1RvqpzY+ebcDjfgiz
	1pmnf6JX1MAUisipGhP9DxbjmvTfMAAbKNxJeeHo74Zo1HLpEGnJMZUALkRn/WDNhVYtvr
	WGwC4mE/WCTWancoimZWfJyhk1BDJns=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-503-wyTmR0XrO-Sz7qNhw6l8bQ-1; Thu, 16 Jan 2025 02:36:01 -0500
X-MC-Unique: wyTmR0XrO-Sz7qNhw6l8bQ-1
X-Mimecast-MFC-AGG-ID: wyTmR0XrO-Sz7qNhw6l8bQ
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-21661949f23so19693425ad.3
        for <linux-doc@vger.kernel.org>; Wed, 15 Jan 2025 23:36:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737012961; x=1737617761;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eui++kz06c5Zm0ps9MJyTagiDgf7HwZZozSXkY68zTU=;
        b=YjrpOM6IRgjrwZw2GWfRcZn6uPg4dyVeeyAQUkiglvgSnYygE48mhPzI1wYl1dgqWp
         2soayccZ3anE/njzq7kDMPVk7gj9owcMFCZn48kxbxyfzwF+qZjJ16ahdpXctgMbAtEv
         y30TgNr8eXVZcv/Kp+6DG8+SOnCHcou6rTbpWW5DNR7kS2osMJfObVutK0ELFw381EGE
         vcQrNUG1C6NmSxRa0H6SxLXbKX10O67crTgHQCJyHpfvdbTygPP+jtjAtqKD9GZerfpn
         x3Yl/CN6r5Ild7Dj7q2tpTeYns1pG3qGKTyuMur+Ib4mq5fNsCHv2+jT5EC2wYUT8OMG
         zINQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhz6y5RtHRbIrKBtQWiNrD6CYacwcGi2zuJCKKwizmIBA8ki4ifCjopEHAJNmVSnz1lmhBm+u9zpo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHspWud/1XYK0ilQixqyZOJs5eMOdMv8ix5O3yGiLFWTrQFjoX
	Tn0I4zBW/x7RtvP8jjl/iGii0KN/cWLZG9OzCl22EjK+jiFGWzNYWKFggSNjy1p089CjwWa9J4u
	eUeCjmzKVBGwzrdfluORcFpV1iqP2Sm9rvhTFw3U5tIJBD5kmomWKF+B5RA==
X-Gm-Gg: ASbGncsSSPd+0/5i7uoPvIyB+rLFWd1FBrbIluYb65g8jSmfTGJEtT9Rd1QIJtigETl
	xwCjR85lz3LWMZiw2zb2q7m5GNu1iZfshaRGlrfe8wUyBQyz0b9av/etLUEHY86iNMzeEJ4kIae
	YWQKCtk1Xh/UDGD5gAdxTS/KBxdJkPfvqzkx13bmLjVjXVdWKm24Zcj7EXl6cUf1wbSy6n+kodg
	qHdZ4riPAtIoZoLA8+FoAv1p9fW8dvvo97vPeBvZppyk0eg
X-Received: by 2002:a17:903:41c3:b0:216:3732:ade3 with SMTP id d9443c01a7336-21a83fc3c07mr498538025ad.35.1737012960774;
        Wed, 15 Jan 2025 23:36:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGEQcRSEn9Ttf7WDqWhnh1GKzD9MesNycc+d+4yC2eT+uNtB9t8zLpscJDtx5fwTbfwsBKVTA==
X-Received: by 2002:a17:903:41c3:b0:216:3732:ade3 with SMTP id d9443c01a7336-21a83fc3c07mr498537745ad.35.1737012960451;
        Wed, 15 Jan 2025 23:36:00 -0800 (PST)
Received: from localhost ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f1372e7sm93614325ad.83.2025.01.15.23.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 23:35:59 -0800 (PST)
Date: Thu, 16 Jan 2025 15:32:01 +0800
From: Coiby Xu <coxu@redhat.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: kexec@lists.infradead.org, Ondrej Kozina <okozina@redhat.com>, 
	Milan Broz <gmazyland@gmail.com>, Thomas Staudt <tstaudt@de.ibm.com>, 
	Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>, Kairui Song <ryncsn@gmail.com>, 
	Jan Pazdziora <jpazdziora@redhat.com>, Pingfan Liu <kernelfans@gmail.com>, Baoquan He <bhe@redhat.com>, 
	Dave Young <dyoung@redhat.com>, linux-kernel@vger.kernel.org, x86@kernel.org, 
	Dave Hansen <dave.hansen@intel.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Vivek Goyal <vgoyal@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v7 2/7] crash_dump: make dm crypt keys persist for the
 kdump kernel
Message-ID: <6wziog4akqkpye72r33srnfk4peojizdi3q55ipu2zvinusfov@iagx6it375qd>
References: <20250116065825.1041558-1-coxu@redhat.com>
 <20250116065825.1041558-3-coxu@redhat.com>
 <4a663a07-2442-4552-b524-a5cc6b06b727@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <4a663a07-2442-4552-b524-a5cc6b06b727@infradead.org>

On Wed, Jan 15, 2025 at 11:04:23PM -0800, Randy Dunlap wrote:
>Hi,

Hi Randy,

I appreciate your quick response!

>
>On 1/15/25 10:58 PM, Coiby Xu wrote:
>> diff --git a/Documentation/admin-guide/kdump/kdump.rst b/Documentation/admin-guide/kdump/kdump.rst
>> index 5376890adbeb..192d6796ab94 100644
>> --- a/Documentation/admin-guide/kdump/kdump.rst
>> +++ b/Documentation/admin-guide/kdump/kdump.rst
>> @@ -551,6 +551,34 @@ from within add_taint() whenever the value set in this bitmask matches with the
>>  bit flag being set by add_taint().
>>  This will cause a kdump to occur at the add_taint()->panic() call.
>>
>> +Write the dump file to encrypted disk volume
>> +============================================
>> +
>> +CONFIG_CRASH_DM_CRYPT can be enabled to support saving the dump file to
>> +encrypted disk volume. User space can interact with
>
>   an encrypted disk volume.
>
>> +/sys/kernel/config/crash_dm_crypt_keys for setup,
>> +
>> +1. Tell the 1st kernel what keys are needed to unlock the disk volumes,
>
>               first
>
>> +    # Add key #1
>> +    mkdir /sys/kernel/config/crash_dm_crypt_keys/7d26b7b4-e342-4d2d-b660-7426b0996720
>> +    # Add key #1's description
>> +    echo cryptsetup:7d26b7b4-e342-4d2d-b660-7426b0996720 > /sys/kernel/config/crash_dm_crypt_keys/description
>> +
>> +    # how many keys do we have now?
>> +    cat /sys/kernel/config/crash_dm_crypt_keys/count
>> +    1
>> +
>> +    # Add key#2 in the same way
>
>             key #2
>(be consisent)
>
>> +
>> +    # how many keys do we have now?
>> +    cat /sys/kernel/config/crash_dm_crypt_keys/count
>> +    2
>> +
>> +2. Load the dump-capture kernel
>> +
>> +3. After dump-capture kerne get booted, restore the keys to user keyring
>
>      After the dump-capture kernel is booted,

Thanks for catching the above issues! I'll apply all your suggested
changes to next version.

>
>> +   echo yes > /sys/kernel/crash_dm_crypt_keys/restore
>> +
>>  Contact
>>  =======
>>
>
>-- 
>~Randy
>
>

-- 
Best regards,
Coiby

