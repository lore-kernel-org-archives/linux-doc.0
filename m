Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72902E810A3
	for <linux-doc@archiver.kernel.org>; Wed, 27 Sep 2023 08:09:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229993AbjI0IJO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 27 Sep 2023 04:09:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230027AbjI0IJN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 27 Sep 2023 04:09:13 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5426112A
        for <linux-doc@vger.kernel.org>; Wed, 27 Sep 2023 01:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1695802105;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5mqMeT0GBWYCKzb+u61vBU4JG18vUL40FriF6j8Y60Y=;
        b=TY1gnJH6btPAwR6xFDinii1gHcGQ6VMWh1wkwro3ZPU0sC7rzDY1zInzH/PbhXGzUHkXsk
        tQVDO6DFkMCXOO7vA4qFna5SO9yXiTOQ2uoBoLvdmSDbcEPz5wGNT4V+PGB5a5Pd+yqlLW
        vQOzz6JVoxTxIR7LKMBLRTa4W6hLjfM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-442-AarJ6speMtmrS6X_ILI1kQ-1; Wed, 27 Sep 2023 04:08:24 -0400
X-MC-Unique: AarJ6speMtmrS6X_ILI1kQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-9a9f282713fso868528866b.3
        for <linux-doc@vger.kernel.org>; Wed, 27 Sep 2023 01:08:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695802103; x=1696406903;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5mqMeT0GBWYCKzb+u61vBU4JG18vUL40FriF6j8Y60Y=;
        b=D/aoYKjCoW1412jVw8so1imp4RcmLTVgWcUNt5KQ3r/IGd0qGcfT0tmoz0opor4mvv
         pPO8x7iTuSrhBypdRJd2ReZABWa26YFFSxNTLapLiXAEcU/NmkMxBbIxLQP1XTP+vSJ2
         jXIvbCZd5LJ6QO3qKK69AAGUuAT9h2pt472hbXaJsFZJDY2Uk6JHg0P1u4+Prdf8Frx1
         t3KtoAukGk1UxkLtnhekqqXcYHxBgZOKp83pMIAbsfWKk6u9gdZzg8XMg0n2AUqsOiQi
         Iu5jvxNRliNOeY+e7who9xY1lQqm5MlIOHVmOeqscSbr54ys2ehvLsTjRJd00ZiB2Msc
         GokA==
X-Gm-Message-State: AOJu0YwI7p0WsY2cc8pUvHG/+360R3rIdNkErTy8qKzUWNCZV/z0QTbW
        JUIgL18rm6abdV3E0GHHKW/OAp3ptBCJUk57kKkJ18TkRA3YmzD3jLI3oXT8u5NA2D7OUCOlO1E
        m52i90reiZ69+D7zXxH5u
X-Received: by 2002:a17:906:2212:b0:9ae:56ad:65a7 with SMTP id s18-20020a170906221200b009ae56ad65a7mr987926ejs.45.1695802103015;
        Wed, 27 Sep 2023 01:08:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxKAz3HMBPYU5epxppQchfC2mZ+xbnrxSo7eq4GJvChG4PLWopfq+HNG36xPgmab4BliTrAQ==
X-Received: by 2002:a17:906:2212:b0:9ae:56ad:65a7 with SMTP id s18-20020a170906221200b009ae56ad65a7mr987908ejs.45.1695802102572;
        Wed, 27 Sep 2023 01:08:22 -0700 (PDT)
Received: from [192.168.1.217] ([109.36.155.235])
        by smtp.gmail.com with ESMTPSA id ha26-20020a170906a89a00b009930308425csm8893137ejb.31.2023.09.27.01.08.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Sep 2023 01:08:21 -0700 (PDT)
Message-ID: <24248f7e-42f2-eea4-d748-c562f529a12f@redhat.com>
Date:   Wed, 27 Sep 2023 10:08:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5] platform/x86: thinkpad_acpi: sysfs interface to auxmac
To:     "Fernando Eckhardt Valle (FIPT)" <fevalle@ipt.br>,
        "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
        "mpearson-lenovo@squebb.ca" <mpearson-lenovo@squebb.ca>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "hmh@hmh.eng.br" <hmh@hmh.eng.br>,
        "markgross@kernel.org" <markgross@kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "ibm-acpi-devel@lists.sourceforge.net" 
        <ibm-acpi-devel@lists.sourceforge.net>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
References: <20230925184133.6735-1-fevalle@ipt.br>
 <0efd719a-802d-1401-7cee-d3918b47441d@redhat.com>
 <CPVP152MB50532B5F8BBAC92243930842D8C3A@CPVP152MB5053.LAMP152.PROD.OUTLOOK.COM>
Content-Language: en-US
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CPVP152MB50532B5F8BBAC92243930842D8C3A@CPVP152MB5053.LAMP152.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On 9/26/23 20:42, Fernando Eckhardt Valle (FIPT) wrote:
> Thanks for the review Hans, I'll send a new version with some adjustments.
> 
>> Note this is just a preference you keen keep this as is
>> if you want,
> I liked the Ilpo suggestion, with two 'gotos' is eliminated repeated code. If everything is ok, I prefer it this way.

If you prefer the 2 goto solution from v5 then keeping it as is is fine.

Regards,

Hans




> ________________________________________
> From: Hans de Goede <hdegoede@redhat.com>
> Sent: Tuesday, September 26, 2023 7:23 AM
> To: Fernando Eckhardt Valle (FIPT); ilpo.jarvinen@linux.intel.com; mpearson-lenovo@squebb.ca; corbet@lwn.net; hmh@hmh.eng.br; markgross@kernel.org; linux-doc@vger.kernel.org; linux-kernel@vger.kernel.org; ibm-acpi-devel@lists.sourceforge.net; platform-driver-x86@vger.kernel.org
> Subject: Re: [PATCH v5] platform/x86: thinkpad_acpi: sysfs interface to auxmac
> 
> Hi,
> 
> It looks like I just reviewed an old version, reviewing this version now ...
> 
> On 9/25/23 20:41, Fernando Eckhardt Valle wrote:
>> Newer Thinkpads have a feature called MAC Address Pass-through.
>> This patch provides a sysfs interface that userspace can use
>> to get this auxiliary mac address.
>>
>> Signed-off-by: Fernando Eckhardt Valle <fevalle@ipt.br>
>> ---
>> Changes in v5:
>> - Repeated code deleted.
>> - Adjusted offset of a strscpy().
>> Changes in v4:
>> - strscpy() in all string copies.
>> Changes in v3:
>> - Added null terminator to auxmac string when copying auxiliary
>> mac address value.
>> Changes in v2:
>> - Added documentation.
>> - All handling of the auxmac value is done in the _init function.
>> ---
>>  .../admin-guide/laptops/thinkpad-acpi.rst     | 20 +++++
>>  drivers/platform/x86/thinkpad_acpi.c          | 81 +++++++++++++++++++
>>  2 files changed, 101 insertions(+)
>>
>> diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
>> index e27a1c3f6..98d304010 100644
>> --- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
>> +++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
>> @@ -53,6 +53,7 @@ detailed description):
>>       - Lap mode sensor
>>       - Setting keyboard language
>>       - WWAN Antenna type
>> +     - Auxmac
>>
>>  A compatibility table by model and feature is maintained on the web
>>  site, http://ibm-acpi.sf.net/. I appreciate any success or failure
>> @@ -1511,6 +1512,25 @@ Currently 2 antenna types are supported as mentioned below:
>>  The property is read-only. If the platform doesn't have support the sysfs
>>  class is not created.
>>
>> +Auxmac
>> +------
>> +
>> +sysfs: auxmac
>> +
>> +Some newer Thinkpads have a feature called MAC Address Pass-through. This
>> +feature is implemented by the system firmware to provide a system unique MAC,
>> +that can override a dock or USB ethernet dongle MAC, when connected to a
>> +network. This property enables user-space to easily determine the MAC address
>> +if the feature is enabled.
>> +
>> +The values of this auxiliary MAC are:
>> +
>> +        cat /sys/devices/platform/thinkpad_acpi/auxmac
>> +
>> +If the feature is disabled, the value will be 'disabled'.
>> +
>> +This property is read-only.
>> +
>>  Adaptive keyboard
>>  -----------------
>>
>> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
>> index d70c89d32..2324ebb46 100644
>> --- a/drivers/platform/x86/thinkpad_acpi.c
>> +++ b/drivers/platform/x86/thinkpad_acpi.c
>> @@ -10785,6 +10785,82 @@ static struct ibm_struct dprc_driver_data = {
>>       .name = "dprc",
>>  };
>>
>> +/*
>> + * Auxmac
>> + *
>> + * This auxiliary mac address is enabled in the bios through the
>> + * MAC Address Pass-through feature. In most cases, there are three
>> + * possibilities: Internal Mac, Second Mac, and disabled.
>> + *
>> + */
>> +
>> +#define AUXMAC_LEN 12
>> +#define AUXMAC_START 9
>> +#define AUXMAC_STRLEN 22
>> +#define AUXMAC_BEGIN_MARKER 8
>> +#define AUXMAC_END_MARKER 21
>> +
>> +static char auxmac[AUXMAC_LEN + 1];
>> +
>> +static int auxmac_init(struct ibm_init_struct *iibm)
>> +{
>> +     acpi_status status;
>> +     struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
>> +     union acpi_object *obj;
>> +
>> +     status = acpi_evaluate_object(NULL, "\\MACA", NULL, &buffer);
>> +
>> +     if (ACPI_FAILURE(status))
>> +             return -ENODEV;
> 
> In this code path you don't initialize the "auxmac" buffer at all,
> but your auxmac_attr_group does not have an is_visible callback,
> so the auxmax sysfs attr will still show up.
> 
> Please add an is_visible callback and retuern 0 (not visible)
> when auxmac[0] == 0; See existing is_visible code for some
> examples.
> 
>> +
>> +     obj = buffer.pointer;
>> +
>> +     if (obj->type != ACPI_TYPE_STRING || obj->string.length != AUXMAC_STRLEN) {
>> +             pr_info("Invalid buffer for MAC address pass-through.\n");
>> +             goto auxmacinvalid;
>> +     }
>> +
>> +     if (obj->string.pointer[AUXMAC_BEGIN_MARKER] != '#' ||
>> +         obj->string.pointer[AUXMAC_END_MARKER] != '#') {
>> +             pr_info("Invalid header for MAC address pass-through.\n");
>> +             goto auxmacinvalid;
>> +     }
>> +
>> +     if (strncmp(obj->string.pointer + AUXMAC_START, "XXXXXXXXXXXX", AUXMAC_LEN) != 0)
>> +             strscpy(auxmac, obj->string.pointer + AUXMAC_START, AUXMAC_LEN + 1);
> 
> Please use sizeof(auxmac) as last parameter to strscpy() here.
> 
>> +     else
>> +             strscpy(auxmac, "disabled", AUXMAC_LEN);
> 
> Please use sizeof(auxmac) as last parameter to strscpy() here.
> 
> Also note how you pass 2 different dest-sizes for the same dest buffer before,
> which looks weird ...
> 
> 
>> +
>> +free:
>> +     kfree(obj);
>> +     return 0;
>> +
>> +auxmacinvalid:
>> +     strscpy(auxmac, "unavailable", AUXMAC_LEN);
>> +     goto free;
>> +}
> 
> I'm not liking the goto dance here, I would prefer:
> 
>         kfree(obj);
>         return 0;
> 
> auxmacinvalid:
>         strscpy(auxmac, "unavailable", AUXMAC_LEN);
>         kfree(obj);
>         return 0;
> 
> It is quite normal for an error-exit path to repeat a kfree().
> 
> Note this is just a preference you keen keep this as is
> if you want, but to me the goto free which jumps up looks
> pretty weird.
> 
> Regards,
> 
> Hans
> 
> 
> 
>> +
>> +static struct ibm_struct auxmac_data = {
>> +     .name = "auxmac",
>> +};
>> +
>> +static ssize_t auxmac_show(struct device *dev,
>> +                        struct device_attribute *attr,
>> +                        char *buf)
>> +{
>> +     return sysfs_emit(buf, "%s\n", auxmac);
>> +}
>> +static DEVICE_ATTR_RO(auxmac);
>> +
>> +static struct attribute *auxmac_attributes[] = {
>> +     &dev_attr_auxmac.attr,
>> +     NULL
>> +};
>> +
>> +static const struct attribute_group auxmac_attr_group = {
>> +     .attrs = auxmac_attributes,
>> +};
>> +
>>  /* --------------------------------------------------------------------- */
>>
>>  static struct attribute *tpacpi_driver_attributes[] = {
>> @@ -10843,6 +10919,7 @@ static const struct attribute_group *tpacpi_groups[] = {
>>       &proxsensor_attr_group,
>>       &kbdlang_attr_group,
>>       &dprc_attr_group,
>> +     &auxmac_attr_group,
>>       NULL,
>>  };
>>
>> @@ -11414,6 +11491,10 @@ static struct ibm_init_struct ibms_init[] __initdata = {
>>               .init = tpacpi_dprc_init,
>>               .data = &dprc_driver_data,
>>       },
>> +     {
>> +             .init = auxmac_init,
>> +             .data = &auxmac_data,
>> +     },
>>  };
>>
>>  static int __init set_ibm_param(const char *val, const struct kernel_param *kp)
> 
> 

