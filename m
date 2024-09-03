Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C89B1D0DEE
	for <linux-doc@vger.kernel.org>; Tue,  3 Sep 2024 08:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725352263; cv=none; b=Bt7SF/zmkOMbRVLQhePJZtLfW32A4jlZRyYngu+BGpAh8bO75BlI/Vscm1XCA5Y2nzHZ03NjaW4bsSJxxKgYz4zDdbFl4ziIJ3jt/eOs5h8O/1Eu+tEyMyd5q1uuHPHqbKDs2s0RTAph8uTROXI7G/+Vcw9fREeBL959iepaUTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725352263; c=relaxed/simple;
	bh=2ElgtpsLH49pq64FM45TlSDeoedyuq5aD32fS6N5ytg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YINtQU6XcQoBXfM6/LZig2meQATfT3AF1bcrCsZpqE2LynTrnuFKITL55VGx2FIlsOwtWc2vVmYg9u3qC+PgVX8WqPpU6qVFHYMqpaNVYft0Fk+HKW3YtQptsf54iSvNhbo4Lw5PT9bwBy+gxfPb9qona5wwBRdKAItTP5EIDX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O7ZRLK76; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O7ZRLK76"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725352261;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+cJKQeV1v5FhWN29V7hcqMh8iaP1E/jqKMaUykXimac=;
	b=O7ZRLK760djXJDWOqUmo6TNXPdeCHsW5ZBpMzcc2GId9M9WW98GHipnj4TGN0acK+9yViW
	x+IWUs81lkgnQLnSH82Urciyq87Z3OwqhKjjzMo75kkMkeoruoH9gQKeau/pov++TR4phH
	a6ZttXC2NlFSmea3Oo7UkjgQKLXG5vs=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-494-W541z4cgMm-WF_t4ymRbTw-1; Tue, 03 Sep 2024 04:31:00 -0400
X-MC-Unique: W541z4cgMm-WF_t4ymRbTw-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5c25cf44030so1216635a12.0
        for <linux-doc@vger.kernel.org>; Tue, 03 Sep 2024 01:31:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725352259; x=1725957059;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+cJKQeV1v5FhWN29V7hcqMh8iaP1E/jqKMaUykXimac=;
        b=qlaWZTHNmkPoAs7pYUwSdYmPzU3PB8uFWStBY78LKYqLcGzDCE4c9WONT3aiYSdiNs
         6x4ZeJYcebHlB3CLWaqLmqRNzaBO2Ku4QOVWVkuFzFP3gKQEPnH6GzHzgDGz/lfXbNw7
         JjHhH0yc7EzswIzc4VC+AGEpyAx+0f7K5mkslJeUfII6ALdjzZgfXLnfG6Hr2TYEYVG3
         J/5mu1fdzoR+zTvjS8ZhYfKgjsyEyf8yUVV7dkvnfeexlvihCd/To3PjTSmTF1jjOloB
         87JUnecCoTGlHkG87Q5RzAEA9whGAsRUxepw4OWtx4yLfBuDBQIAQwBEUV7toBLoVGYZ
         +SOQ==
X-Forwarded-Encrypted: i=1; AJvYcCViqRZGukGTsQy+R9Snd9yS4Dq7CRf4AgVnw+LSGjYOBXlsx3/ndGqfj4VRdZDc2M6phuUdGm5C1Oo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyja/7FLbbqQf8k50Kp5CwXR8a8yNvfh6eDKYjU/+E+J0qumhUx
	FT3/sWyzMJLpqAjc4U1Tx5oaztfkEoMFeP/br4T+J44ENvgoFV7YCOeBRxk03xPMcFBGukBZtKU
	uv+A6Mcy+uIhntRu0/TRKwB4XmJO1Ivba9C9hL4FXDimhgdedWTPJ1cjEZSBJtvY1hw==
X-Received: by 2002:a05:6402:2102:b0:5c2:5075:7d1 with SMTP id 4fb4d7f45d1cf-5c250750b1dmr5365690a12.7.1725352258799;
        Tue, 03 Sep 2024 01:30:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7y5oZkTYindPO/P0w21ufnOGgBI2ctCtk4BqlfPs6wuvoZ6g5a1F3JyG2SMXkFgnu2ahLFg==
X-Received: by 2002:a05:6402:2102:b0:5c2:5075:7d1 with SMTP id 4fb4d7f45d1cf-5c250750b1dmr5365670a12.7.1725352258264;
        Tue, 03 Sep 2024 01:30:58 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c226c7c3a8sm6200818a12.49.2024.09.03.01.30.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Sep 2024 01:30:57 -0700 (PDT)
Message-ID: <f385b684-f6c3-4181-8386-68cb4e04358f@redhat.com>
Date: Tue, 3 Sep 2024 10:30:57 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [daniel-lezcano:timers/drivers/next 4/9]
 drivers/platform/x86/intel/pmc/core.c:1213: warning: This comment starts with
 '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
To: kernel test robot <lkp@intel.com>, Marek Maslanka <mmaslanka@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Daniel Lezcano
 <daniel.lezcano@linaro.org>, linux-doc@vger.kernel.org
References: <202409031410.a9beukFc-lkp@intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <202409031410.a9beukFc-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9/3/24 8:10 AM, kernel test robot wrote:
> tree:   http://git.linaro.org/people/daniel.lezcano/linux timers/drivers/next
> head:   8f8b0349aa312eb7e67e623ed1f296a04126fe7f
> commit: 2d167560d43c809c66e6389b6cc651b77fcbf951 [4/9] platform/x86:intel/pmc: Enable the ACPI PM Timer to be turned off when suspended
> config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240903/202409031410.a9beukFc-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240903/202409031410.a9beukFc-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202409031410.a9beukFc-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>>> drivers/platform/x86/intel/pmc/core.c:1213: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>     * Enable or disable ACPI PM Timer
> 
> 
> vim +1213 drivers/platform/x86/intel/pmc/core.c
> 
>   1211	
>   1212	/**
>> 1213	 * Enable or disable ACPI PM Timer
>   1214	 *
>   1215	 * This function is intended to be a callback for ACPI PM suspend/resume event.
>   1216	 * The ACPI PM Timer is enabled on resume only if it was enabled during suspend.
>   1217	 */

Ok, so to fix this we just need to change the /** to /* .

Marek, can you please submit a patch for this to Daniel?

Since the commit introducing this problem is in Daniel's
linux/timers/drivers/next tree, the fix will need to be merged
there too.

Regards,

Hans


