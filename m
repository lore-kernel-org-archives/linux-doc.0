Return-Path: <SRS0=OhIE=27=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 016E8C33CA4
	for <linux-doc@archiver.kernel.org>; Fri, 10 Jan 2020 19:49:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CB39820848
	for <linux-doc@archiver.kernel.org>; Fri, 10 Jan 2020 19:49:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Lm0he3q0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728254AbgAJTtC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 10 Jan 2020 14:49:02 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:54292 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727812AbgAJTtB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 10 Jan 2020 14:49:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1578685740;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=riUDIprs0OHwhmObTROTPPNxIryJYavnWepv59WA+CA=;
        b=Lm0he3q0adbAAlE2ec1hTg/cQeWZBPP8kAgzvAgJgnjzk/QAaEmljePhZF0KiT/vWxQMqD
        BIeSfIu+VaetTuoAP67NNVW8YlVqOHizK1+p5tzNN7sIbJWGfHQtXR5iiHEGK79vqUzjz+
        dLWwH9fEVbFBNwu2X+J5R9ddOiN3ROM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-WL1kxRvMPW2eWTah0h9jZQ-1; Fri, 10 Jan 2020 14:48:57 -0500
X-MC-Unique: WL1kxRvMPW2eWTah0h9jZQ-1
Received: by mail-wr1-f70.google.com with SMTP id f17so1367356wrt.19
        for <linux-doc@vger.kernel.org>; Fri, 10 Jan 2020 11:48:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=riUDIprs0OHwhmObTROTPPNxIryJYavnWepv59WA+CA=;
        b=f9KyUvLQYHX+QP3TVa//MjOj0YyrH1kKvb0vea8uta5KAXcFaU3RKTmzbY2lh3DrTE
         GNvRYYRpOgLiK0w+pUYWbgkLksa2seXM5UUNMUzoODzyzL0EMa0dG6XkvgqP3IPC54qp
         wY4g0W1ac9qSY727G43gjbP8OGAXYu/5Y8/PV0jC43nBnJ1g5wWHyh1w5X1yeTtVa9h2
         +BydsxL9G4tNIw15s9Onk8xm9h4x/SqF0yXr1CsvWO/hEXhTxeyIaRhC4rscpUWk/2o8
         jCGSLjM/IqRKlrkeY9kLI+AQ0IMRM1C0N6Y6nXBofuEHJCJ+kAiJYS2eCz78dgMlRNJM
         ImLA==
X-Gm-Message-State: APjAAAWxX2MuVfClOnGDNc6ojl69xHsX5D8MimrrnB/AUWvx3owBmnHU
        ez42RIBngFKgsqf8wJgBKdsDo9xcw0rFlLgjc9XHx1Zr0v0XtNBpBYrAcDtWLAjOA4SZrHdoDvK
        8bTA5K7FpQ2TPkxFbzQN7
X-Received: by 2002:a5d:6a02:: with SMTP id m2mr4963212wru.52.1578685736122;
        Fri, 10 Jan 2020 11:48:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqxnkUfoP+uLL1SY4zC1FGF5vm1kFUOUl7yLkO6Ifz3AOpkkYChb29i69nRMpO6ILyWjfQK53w==
X-Received: by 2002:a5d:6a02:: with SMTP id m2mr4963192wru.52.1578685735822;
        Fri, 10 Jan 2020 11:48:55 -0800 (PST)
Received: from dhcp-44-196.space.revspace.nl ([2a0e:5700:4:11:6eb:1143:b8be:2b8])
        by smtp.gmail.com with ESMTPSA id f17sm3450764wmc.8.2020.01.10.11.48.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2020 11:48:55 -0800 (PST)
Subject: Re: [PATCH v10 05/10] test_firmware: add support for
 firmware_request_platform
To:     Luis Chamberlain <mcgrof@kernel.org>
Cc:     Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H . Peter Anvin" <hpa@zytor.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Peter Jones <pjones@redhat.com>,
        Dave Olsthoorn <dave@bewaar.me>, x86@kernel.org,
        platform-driver-x86@vger.kernel.org, linux-efi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-input@vger.kernel.org
References: <20191210115117.303935-1-hdegoede@redhat.com>
 <20191210115117.303935-6-hdegoede@redhat.com>
 <20200106213343.GV11244@42.do-not-panic.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <071db8c5-4be1-c6d1-0ccb-a2268cd5b347@redhat.com>
Date:   Fri, 10 Jan 2020 20:48:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20200106213343.GV11244@42.do-not-panic.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On 1/6/20 10:33 PM, Luis Chamberlain wrote:
> On Tue, Dec 10, 2019 at 12:51:12PM +0100, Hans de Goede wrote:
>> Add support for testing firmware_request_platform through a new
>> trigger_request_platform trigger.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>   lib/test_firmware.c | 68 +++++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 68 insertions(+)
>>
>> diff --git a/lib/test_firmware.c b/lib/test_firmware.c
>> index 251213c872b5..9af00cfc8979 100644
>> --- a/lib/test_firmware.c
>> +++ b/lib/test_firmware.c
>> @@ -24,6 +24,7 @@
>>   #include <linux/delay.h>
>>   #include <linux/kthread.h>
>>   #include <linux/vmalloc.h>
>> +#include <linux/efi_embedded_fw.h>
>>   
>>   #define TEST_FIRMWARE_NAME	"test-firmware.bin"
>>   #define TEST_FIRMWARE_NUM_REQS	4
>> @@ -507,12 +508,76 @@ static ssize_t trigger_request_store(struct device *dev,
>>   }
>>   static DEVICE_ATTR_WO(trigger_request);
>>   
>> +#ifdef CONFIG_EFI_EMBEDDED_FIRMWARE
>> +static ssize_t trigger_request_platform_store(struct device *dev,
>> +					      struct device_attribute *attr,
>> +					      const char *buf, size_t count)
>> +{
>> +	static const u8 test_data[] = {
>> +		0x55, 0xaa, 0x55, 0xaa, 0x01, 0x02, 0x03, 0x04,
>> +		0x55, 0xaa, 0x55, 0xaa, 0x05, 0x06, 0x07, 0x08,
>> +		0x55, 0xaa, 0x55, 0xaa, 0x10, 0x20, 0x30, 0x40,
>> +		0x55, 0xaa, 0x55, 0xaa, 0x50, 0x60, 0x70, 0x80
>> +	};
>> +	struct efi_embedded_fw fw;
>> +	int rc;
>> +	char *name;
>> +
>> +	name = kstrndup(buf, count, GFP_KERNEL);
>> +	if (!name)
>> +		return -ENOSPC;
>> +
>> +	pr_info("inserting test platform fw '%s'\n", name);
>> +	fw.name = name;
>> +	fw.data = (void *)test_data;
>> +	fw.length = sizeof(test_data);
>> +	list_add(&fw.list, &efi_embedded_fw_list);
>> +
>> +	pr_info("loading '%s'\n", name);
>> +
>> +	mutex_lock(&test_fw_mutex);
>> +	release_firmware(test_firmware);
>> +	test_firmware = NULL;
> 
> Seems odd to have the above two lines here before the request, why not
> after as noted below.

I modelled this after trigger_request_store which keeps the
test_firmware around after it has been called so that its contents can be
read back from the char misc device which the test_firmware module registers.

Since e.g. trigger_request_store which keeps the test_firmware around
we must check and free it before assigning a new firmware to it using
firmware_request_platform, which is why this is done before and not
after the request.

> 
>> +	rc = firmware_request_platform(&test_firmware, name, dev);
>> +	if (rc) {
>> +		pr_info("load of '%s' failed: %d\n", name, rc);
>> +		goto out;
>> +	}
>> +	if (test_firmware->size != sizeof(test_data) ||
>> +	    memcmp(test_firmware->data, test_data, sizeof(test_data)) != 0) {
>> +		pr_info("firmware contents mismatch for '%s'\n", name);
>> +		rc = -EINVAL;
>> +		goto out;
>> +	}
>> +	pr_info("loaded: %zu\n", test_firmware->size);
>> +	rc = count;
> 
> Here.
> 
>> +
>> +out:
>> +	mutex_unlock(&test_fw_mutex);
>> +
>> +	list_del(&fw.list);
>> +	kfree(name);
>> +
>> +	return rc;
>> +}
>> +static DEVICE_ATTR_WO(trigger_request_platform);
>> +#endif
>> +
>>   static DECLARE_COMPLETION(async_fw_done);
>>   
>>   static void trigger_async_request_cb(const struct firmware *fw, void *context)
>>   {
>>   	test_firmware = fw;
>>   	complete(&async_fw_done);
>> +
>> +
>> +
>> +
>> +
>> +
>> +
>> +
>> +
>>   }
> 
> Ummm, new empty lines without any code added... did you forget
> something?  Please address this.

This is a left over from an earlier version of the patch, my bad, I will remove
this and send out a new version.

Regards,

Hans

