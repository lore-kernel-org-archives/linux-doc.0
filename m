Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9DFAC7D048
	for <lwn-linux-doc@archive.lwn.net>; Fri, 15 Jun 2018 18:15:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1756414AbeFOSPI (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 15 Jun 2018 14:15:08 -0400
Received: from mail-lf0-f66.google.com ([209.85.215.66]:36008 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756446AbeFOSPF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 15 Jun 2018 14:15:05 -0400
Received: by mail-lf0-f66.google.com with SMTP id n24-v6so161551lfh.3
        for <linux-doc@vger.kernel.org>; Fri, 15 Jun 2018 11:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=EX/ew5KqMmTJ2l62+rFeYqOgZLuRFFZxzZDpJ/EkTAY=;
        b=HsgTJoAQICMxmvkVyHXxWBXoPfO1KlAG7rN6MtKcq6NCE5aMTjrXTSmV8qxrt7DOCn
         frEy6WA2FDSwQ72KTKHQjAi96QWt3u57aq0MkBtwGLRr/pJ0iwPiehEjlI2rDTjRWvpq
         O1h9hN3IZM2gbDDDLmACH3Tx6vbl0Imxf8md8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=EX/ew5KqMmTJ2l62+rFeYqOgZLuRFFZxzZDpJ/EkTAY=;
        b=i8PYumLanFv1ojCTouu93vxwD9t8dJsk0PYfPxZOuOq4Yx65AoTaklzaPinm5KViua
         4IpMXT4duwihXkB8Iyjm4r95KbW2NV9pNp2HWZCPSkWs28V9Lx4gw0OTVfqmP7/sPzeA
         tbPCs6qYBhdXl7tDdrq/fDixrLGCQ33/rAbbV1kFesBpXvCV5hWGT3aRotPLpG6pJaq+
         tZyST99SO6fXT39/4nlmVFkOW27Vu8h1wx8XyPHJlJErYe5WsWda8W7KqcRquOglD2zB
         q+yObmMWhBHSa3jzMbPK5Mq4SOeJRp8L99jSlUH6vMSHIaTqsixt1Xi2uDucDMc3U1Y+
         sCig==
X-Gm-Message-State: APt69E2IOJz1Y3/o8Gf1yQzUFc1n+rWHTCWWItS85W6iEruRspdlga5Z
        YYdR6zJ7cG35LzRS6ejcTk5eQw==
X-Google-Smtp-Source: ADUXVKJdFYWwNql4rBHRf0Jq5GDcFyObYU03PcFF1nn6tuDvY9EvDhUzlqX8cYVOk+m4rgvteeV5BA==
X-Received: by 2002:a2e:4dcc:: with SMTP id c73-v6mr1931671ljd.135.1529086504161;
        Fri, 15 Jun 2018 11:15:04 -0700 (PDT)
Received: from khorivan (59-201-94-178.pool.ukrtel.net. [178.94.201.59])
        by smtp.gmail.com with ESMTPSA id w1-v6sm1586278lfk.59.2018.06.15.11.15.02
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Jun 2018 11:15:03 -0700 (PDT)
Date:   Fri, 15 Jun 2018 21:15:01 +0300
From:   Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
To:     Ilias Apalodimas <ilias.apalodimas@linaro.org>
Cc:     grygorii.strashko@ti.com, davem@davemloft.net, corbet@lwn.net,
        akpm@linux-foundation.org, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, vinicius.gomes@intel.com,
        henrik@austad.us, jesus.sanchez-palencia@intel.com, p-varis@ti.com,
        spatton@ti.com, francois.ozog@linaro.org, yogeshs@ti.com,
        nsekhar@ti.com, andrew@lunn.ch
Subject: Re: [PATCH v2 net-next 4/6] net: ethernet: ti: cpsw: add CBS Qdisc
 offload
Message-ID: <20180615181500.GA2332@khorivan>
Mail-Followup-To: Ilias Apalodimas <ilias.apalodimas@linaro.org>,
        grygorii.strashko@ti.com, davem@davemloft.net, corbet@lwn.net,
        akpm@linux-foundation.org, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, vinicius.gomes@intel.com,
        henrik@austad.us, jesus.sanchez-palencia@intel.com, p-varis@ti.com,
        spatton@ti.com, francois.ozog@linaro.org, yogeshs@ti.com,
        nsekhar@ti.com, andrew@lunn.ch
References: <20180614073650.29659-1-ivan.khoronzhuk@linaro.org>
 <20180614073650.29659-5-ivan.khoronzhuk@linaro.org>
 <20180614080902.GA8377@apalos>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20180614080902.GA8377@apalos>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jun 14, 2018 at 11:09:02AM +0300, Ilias Apalodimas wrote:
[...]

>> +				 "Speed was changed, CBS sahper speeds are changed!");
>typo here, should be shaper

Corrected in v3

-- 
Regards,
Ivan Khoronzhuk
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
