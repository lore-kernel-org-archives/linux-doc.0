Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 077E47D0DA
	for <lwn-linux-doc@archive.lwn.net>; Tue, 20 Mar 2018 19:49:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751320AbeCTTtI (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 20 Mar 2018 15:49:08 -0400
Received: from mail-it0-f67.google.com ([209.85.214.67]:52422 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751269AbeCTTtH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Mar 2018 15:49:07 -0400
Received: by mail-it0-f67.google.com with SMTP id k135-v6so3998387ite.2;
        Tue, 20 Mar 2018 12:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=6hLpDH5YiDvvFPRXNiuyyCbrnox+M/BIXV46qArqG5w=;
        b=d7vSz8RdGrMyXybPWc+Ubv+vXvvo9FXIfsDA1aA6hT9M96GVG0Le8hRAmp5CPxTbA/
         ZC8vD++qMAs7vpyuSU2nqJmukvOmoZIxmvS3/5XgeWMvPSumG4/tHlmHkXApub15zMDu
         9XFdx7N4+zPr+9drl0sXZlHcPr5dKi4Bjwr0RsxtVmGdSIfQRO0GB14PBaD2TfrbZ3QJ
         20gRQvXZemUpVxZ7uPZ6qz3Uu8x/T5IjwJuOGssZ4+oqZTemuSeX0/i7sats3yjbdr+L
         z1WBGOALCZgAUfVI0jVbpMveaX9eqXYa/LhSRooRIQdG6nNash3I4+kiSp2O3PLMm796
         jU2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=6hLpDH5YiDvvFPRXNiuyyCbrnox+M/BIXV46qArqG5w=;
        b=Tq4YR20uX5xd39KNfk8fuTpT4kjGqEsdKOKyZVJlZ8NKAS9K3LZjUcR5cPs/tiCw4c
         juVyIaKk1O/4CWarOQsXY/SwLNZnv/EsZ3gWj6ec2soxih46j5yKuY4J6AjJGTJWsBNB
         NqkLA3EP2Dzx8kbWN3I7uNHgibpb9N4jFgcXN9z/RDIHt+K2KSbDaRtDJQV+/Y/TOXN1
         9XgKSzI22btlVap7Fx3iI2wz3F23ZlNXAXI0Hkh5Dz2UK7IQEHymigJj+l+SClJARml9
         IVbU7hhieEj0aSmv5HluqgkGI6509vyhEsOUWp8nU9J/UupZuxvsEUQg5QtwGDE7/TjC
         eBtA==
X-Gm-Message-State: AElRT7E0z2InmjkF3PpAXIlY9WtEHAh+Vdpl1zzLmuwYkkN75hWceGzw
        X6hacH31xpBhFOEHsocKWFbmIA3Aj88=
X-Google-Smtp-Source: AG47ELtKoGMePrpr7vtmtVWJhfypa7/sEbVYDiltIj1kXzGNd0u0l/Uln2YdW4/5rj73yPKhHDFXBA==
X-Received: by 2002:a24:dbd6:: with SMTP id c205-v6mr1099339itg.63.1521575346521;
        Tue, 20 Mar 2018 12:49:06 -0700 (PDT)
Received: from [104.39.53.110] ([104.39.53.110])
        by smtp.gmail.com with ESMTPSA id y4sm1535784ioy.29.2018.03.20.12.49.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Mar 2018 12:49:06 -0700 (PDT)
Subject: Re: [PATCH] modify one dead link
To:     Sergei Trofimovich <slyfox@gentoo.org>
Cc:     corbet@lwn.net, yamada.masahiro@socionext.com, tony.luck@intel.com,
        bjorn.forsman@gmail.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20180320145422.24331-1-mudongliangabcd@gmail.com>
 <20180320194203.205c6c60@sf>
From:   Dongliang Mu <mudongliangabcd@gmail.com>
Message-ID: <285f442d-c4ad-93be-c3c0-ad04c37f21f8@gmail.com>
Date:   Tue, 20 Mar 2018 15:49:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180320194203.205c6c60@sf>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 03/20/2018 03:42 PM, Sergei Trofimovich wrote:
> On Tue, 20 Mar 2018 10:54:22 -0400
> Dongliang Mu <mudongliangabcd@gmail.com> wrote:
>
>> -    # hg clone http://xenbits.xensource.com/ext/ia64/xen-unstable.hg
>> +    # hg clone http://xenbits.xensource.com/ext/ia64/xen-unstable
>>       # cd xen-unstable.hg
>>       # hg clone http://xenbits.xensource.com/ext/ia64/linux-2.6.18-xen.hg
> You will need to fix a 'cd' as well:
>      cd xen-unstable
I will modify that problem. Then resubmit the patch.

Thanks.
>   
> Otherwise looks good.
>

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
