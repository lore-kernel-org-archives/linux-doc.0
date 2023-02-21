Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6BA5C61DA3
	for <linux-doc@archiver.kernel.org>; Tue, 21 Feb 2023 17:58:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231415AbjBUR6l (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 21 Feb 2023 12:58:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232020AbjBUR6i (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 21 Feb 2023 12:58:38 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 773252F78F
        for <linux-doc@vger.kernel.org>; Tue, 21 Feb 2023 09:58:35 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id bo30so4827282wrb.0
        for <linux-doc@vger.kernel.org>; Tue, 21 Feb 2023 09:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S9iW/ZoFwA+vNVbz0hgRVCmhSYJ67As/r6GQ/C1MS14=;
        b=kkmL3bkoMHa3rpgJXIU9fm2m/Fc9fjZpTR1+czz9opAjVjbwio3hmu13RUzThMYSXr
         dAX9XP9ZETJTtBG/QfX7MLtnF0j7iNoZ+6VR48IL6eY1Uw/Rb2J3XMlPIbrCbU7JbcJm
         5sE1pZjBk+SnC1hEpL2huMoX5Okevrj7K/cC8lPGfxtmEFmCVIJDnloBCXlpxCBZPGQD
         eEyXAU8spQI6HN5l7w6WeCddUq9Hfo3j+p2R/paxWwsuumVe1yo+tgc+axra5TILoAEa
         z/nbx6Ycfgg1nU3Zd1TPZpREwMdRh1wGGq5ltq59Q/PgXdHcnvnLjZX2fUdWRvnsBDF9
         3iHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S9iW/ZoFwA+vNVbz0hgRVCmhSYJ67As/r6GQ/C1MS14=;
        b=4jEME5BLJEnbfCHnHdXrPmPbIwOyFOKUnESi4FkAnRR8PaoncvPasLhgBSrHPB8SkY
         QSUDYwDs/P4vv7raHQ2etzxDfuQjevCd8T/av6Yqy7d6eMipzk7GVlB01PMSuAC8k98t
         WcG3luELP6RWCyC9miCSfEQbznliXqy/r2zeWEatnckvLuGq9sMzb5m1QFLzGqiG2mDD
         Lu6yoGwl7NcaUOVWY+DTqXAJcRpBdSSxmqfauKEo7Q4DT8SVCl3/YfgVNv/LCoQgMw6K
         2s1jlUp0lIHcIyOopHTLRN35Ugf739ztJ8mSaycUMSJ0RvDVfYadxWBkN0SukioNsUEp
         HD1g==
X-Gm-Message-State: AO0yUKVSbE3c/yHtwOsm7xziKiU60bsnoD4beNUyUnYn4MzCihY/Upzk
        jeXpRpJ67A3nUCWD5FYxL68mYw==
X-Google-Smtp-Source: AK7set+2VYBIviYYpXRgHb6iWH4/F+lDyppvQ+R3fLX/zzCucj88ZsetqCFcBEokjGqacqiFHlxYlQ==
X-Received: by 2002:adf:d081:0:b0:2c5:9a0d:70a2 with SMTP id y1-20020adfd081000000b002c59a0d70a2mr4778164wrh.16.1677002313874;
        Tue, 21 Feb 2023 09:58:33 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id z8-20020a056000110800b002c3dc4131f5sm6101436wrw.18.2023.02.21.09.58.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Feb 2023 09:58:33 -0800 (PST)
Message-ID: <51b57a36-a1e0-45c4-7300-6d2a85f30f6d@linaro.org>
Date:   Tue, 21 Feb 2023 17:58:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v10 19/26] gunyah: vm_mgr: Add framework to add VM
 Functions
Content-Language: en-US
To:     Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
        Elliot Berman <quic_eberman@quicinc.com>
Cc:     Alex Elder <elder@linaro.org>,
        Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Murali Nalajala <quic_mnalajal@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Carl van Schaik <quic_cvanscha@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20230214211229.3239350-1-quic_eberman@quicinc.com>
 <20230214212531.3323284-1-quic_eberman@quicinc.com>
 <20230221130759.GD787573@quicinc.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20230221130759.GD787573@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 21/02/2023 13:07, Srivatsa Vaddagiri wrote:
> * Elliot Berman <quic_eberman@quicinc.com> [2023-02-14 13:25:30]:
> 
>> +int __must_check gh_vm_get(struct gh_vm *ghvm)
> 
> Minor comment:
> 
> get_gh_rm vs gh_vm_get -> can follow some consistent convention I think.
> 
> Perhaps get_gh_vm()?

it should be other way around

currently we have combinations of gh_vm and some other pattern, we 
should stick with one, in this case gh_vm_* or gh_rm_* makes more sense

here are all the exported symbols in gunyah.

./drivers/virt/gunyah/vm_mgr.c:EXPORT_SYMBOL_GPL(gh_vm_function_register);
./drivers/virt/gunyah/vm_mgr.c:EXPORT_SYMBOL_GPL(gh_vm_function_unregister);
./drivers/virt/gunyah/vm_mgr.c:EXPORT_SYMBOL_GPL(gh_vm_add_resource_ticket);
./drivers/virt/gunyah/vm_mgr.c:EXPORT_SYMBOL_GPL(gh_vm_remove_resource_ticket);
./drivers/virt/gunyah/vm_mgr.c:EXPORT_SYMBOL_GPL(gh_vm_mmio_write);
./drivers/virt/gunyah/vm_mgr.c:EXPORT_SYMBOL_GPL(gh_vm_add_io_handler);
./drivers/virt/gunyah/vm_mgr.c:EXPORT_SYMBOL_GPL(gh_vm_remove_io_handler);
./drivers/virt/gunyah/vm_mgr.c:EXPORT_SYMBOL_GPL(gh_vm_get);
./drivers/virt/gunyah/vm_mgr.c:EXPORT_SYMBOL_GPL(gh_vm_put);
./drivers/virt/gunyah/rsc_mgr.c:EXPORT_SYMBOL_GPL(gh_rm_notifier_register);
./drivers/virt/gunyah/rsc_mgr.c:EXPORT_SYMBOL_GPL(gh_rm_notifier_unregister);
./drivers/virt/gunyah/rsc_mgr.c:EXPORT_SYMBOL_GPL(get_gh_rm);
./drivers/virt/gunyah/rsc_mgr.c:EXPORT_SYMBOL_GPL(put_gh_rm);
./drivers/virt/gunyah/gunyah.c:EXPORT_SYMBOL_GPL(gh_api_version);
./drivers/virt/gunyah/gunyah.c:EXPORT_SYMBOL_GPL(gh_api_has_feature);
./drivers/virt/gunyah/rsc_mgr_rpc.c:EXPORT_SYMBOL_GPL(gh_rm_get_vmid);
./drivers/virt/gunyah/gunyah_platform_hooks.c:EXPORT_SYMBOL_GPL(gh_rm_platform_pre_mem_share);
./drivers/virt/gunyah/gunyah_platform_hooks.c:EXPORT_SYMBOL_GPL(gh_rm_platform_post_mem_reclaim);
./drivers/virt/gunyah/gunyah_platform_hooks.c:EXPORT_SYMBOL_GPL(gh_rm_register_platform_ops);
./drivers/virt/gunyah/gunyah_platform_hooks.c:EXPORT_SYMBOL_GPL(gh_rm_unregister_platform_ops);
./drivers/virt/gunyah/gunyah_platform_hooks.c:EXPORT_SYMBOL_GPL(devm_gh_rm_register_platform_ops);

> 
> 
>> +{
>> +	return kref_get_unless_zero(&ghvm->kref);
>> +}
>> +EXPORT_SYMBOL_GPL(gh_vm_get);
