Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id ACE207E22E
	for <lwn-linux-doc@archive.lwn.net>; Thu, 12 Apr 2018 17:37:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752736AbeDLRhT (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 12 Apr 2018 13:37:19 -0400
Received: from mail-ot0-f196.google.com ([74.125.82.196]:33499 "EHLO
        mail-ot0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752561AbeDLRhR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 12 Apr 2018 13:37:17 -0400
Received: by mail-ot0-f196.google.com with SMTP id 23-v6so6925231otj.0;
        Thu, 12 Apr 2018 10:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=RUSXcbBkt1fxkghag2nr5gB4UuXXw0/dkFAKGZ7lYIc=;
        b=MxfmZgvfjrltY9enpzcP5HtuOWzK0ZxhEwmpX1oV3CdDUXKs55nr7zi//tvWw88DVg
         PnJs085iJbphWaVmy0WCPQCSx08u3psjuDRwTo/bs/ylDn2CqpWB5xMKhvANEvTa1Dzm
         AgLTR0E8s4FGvWx3k4b/nO9ar85gUMO8RB7IxrK6tS1ttjuWsvpdzk0WHOehdlsZMd96
         j9/38VLwtkhSVo3YBJD8Qq14WRGiSXBPmCxCDDmI/j9PhhxshaQo56w1Zk38rdQniVR2
         S64zvWK7qFPXTY+zDGrsmbglbmultMlp8qxLh8pW1aVxwzLiVaovPqT81dkh8I7SKbci
         Ts3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=RUSXcbBkt1fxkghag2nr5gB4UuXXw0/dkFAKGZ7lYIc=;
        b=NlJJDkk/kVca2zgaCqk2zBtWaqXBb7e8iMVRy71sXhmJltHbw3qU8j9S/x4UOljuhM
         QPS3QykOh6kYlfkDXutznvYZgmuLgiLRm2xH0BE/mjWfZkGquz5fM2TKyuTe6es/eJeV
         SqCkwj+pNCDJbbKM8ka2misGW2Vxm2R0kA6d7CTSzeUD9iB9s6iFnX5xUaGvryxs4fx8
         kiGyE/TkgC1JGi9xYpMmZFTrKsPz3YSRugOHyFMKHPJm6qjA3i+n0gEGgJuA0E/1z4np
         8KpaM7757kdnPHpBCZQGqoQEXxReBfyDvQMUcXyLufpk5VtS/AiXiMPDXAukTrK3m+ut
         +9lA==
X-Gm-Message-State: ALQs6tAWs/BZpKkuQ5RiYft7nZg56feN73HxNJnwEjcFF5P5RaQfEqSb
        dCroNTQdIa5e6UHDj+Ttb5Y=
X-Google-Smtp-Source: AIpwx4/11sS6SoqNZpw9C60HKIjPoqTnVsScmLe46MCGuOQzDzWZV14lyNunDFh69+HNAY7QaTfPnw==
X-Received: by 2002:a9d:7405:: with SMTP id n5-v6mr1241459otk.283.1523554636984;
        Thu, 12 Apr 2018 10:37:16 -0700 (PDT)
Received: from localhost (108-223-40-66.lightspeed.sntcca.sbcglobal.net. [108.223.40.66])
        by smtp.gmail.com with ESMTPSA id 77-v6sm2473947otd.18.2018.04.12.10.37.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Apr 2018 10:37:15 -0700 (PDT)
Date:   Thu, 12 Apr 2018 10:37:14 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc:     Alan Cox <alan@linux.intel.com>, Andrew Jeffery <andrew@aj.id.au>,
        Andrew Lunn <andrew@lunn.ch>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Fengguang Wu <fengguang.wu@intel.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Haiyue Wang <haiyue.wang@linux.intel.com>,
        James Feist <james.feist@linux.intel.com>,
        Jason M Biils <jason.m.bills@linux.intel.com>,
        Jean Delvare <jdelvare@suse.com>,
        Joel Stanley <joel@jms.id.au>,
        Julia Cartwright <juliac@eso.teric.us>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Milton Miller II <miltonm@us.ibm.com>,
        Pavel Machek <pavel@ucw.cz>,
        Randy Dunlap <rdunlap@infradead.org>,
        Stef van Os <stef.van.os@prodrive-technologies.com>,
        Sumeet R Pawnikar <sumeet.r.pawnikar@intel.com>,
        Vernon Mauery <vernon.mauery@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v3 09/10] drivers/hwmon: Add PECI hwmon client drivers
Message-ID: <20180412173714.GA13496@roeck-us.net>
References: <20180410183212.16787-1-jae.hyun.yoo@linux.intel.com>
 <20180410183212.16787-10-jae.hyun.yoo@linux.intel.com>
 <20180410222800.GA8484@roeck-us.net>
 <637d7812-e567-0bc2-4f08-fbdca0ee85d8@linux.intel.com>
 <292be2d9-e572-2e06-9899-f6c2c53fdefc@roeck-us.net>
 <7b378954-1ce8-a2d2-5d09-8b6b36c048be@linux.intel.com>
 <13d4c632-a20e-3c40-066a-1e9df02a0595@roeck-us.net>
 <89c8c847-87e7-a849-e05d-d32b787e9305@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <89c8c847-87e7-a849-e05d-d32b787e9305@linux.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Apr 12, 2018 at 10:09:51AM -0700, Jae Hyun Yoo wrote:
[ ... ]
> >>>>>>+static int find_core_index(struct peci_cputemp *priv, int channel)
> >>>>>>+{
> >>>>>>+    int core_channel = channel - DEFAULT_CHANNEL_NUMS;
> >>>>>>+    int idx, found = 0;
> >>>>>>+
> >>>>>>+    for (idx = 0; idx < priv->gen_info->core_max; idx++) {
> >>>>>>+        if (priv->core_mask & BIT(idx)) {
> >>>>>>+            if (core_channel == found)
> >>>>>>+                break;
> >>>>>>+
> >>>>>>+            found++;
> >>>>>>+        }
> >>>>>>+    }
> >>>>>>+
> >>>>>>+    return idx;
> >>>>>
> >>>>>What if nothing is found ?
> >>>>>
> >>>>
> >>>>Core temperature group will be registered only when it detects at
> >>>>least one core checked by check_resolved_cores(), so
> >>>>find_core_index() can be called only when priv->core_mask has a
> >>>>non-zero value. The 'nothing is found' case will not happen.
> >>>>
> >>>That doesn't guarantee a match. If what you are saying is correct
> >>>there should always be
> >>>a well defined match of channel -> idx, and the search should be
> >>>unnecessary.
> >>>
> >>
> >>There could be some disabled cores in the resolved core mask bit
> >>sequence also it should remove indexing gap in channel numbering so it
> >>is the reason why this search function is needed. Well defined match of
> >>channel -> idx would not be always satisfied.
> >>
> >Are you saying that each call to the function, with the same parameters,
> >can return a different result ?
> >
> 
> No, the result will be consistent. After reading the priv->core_mask once in
> check_resolved_cores(), the value will not be changed. I'm saying about this
> case, for example if core number 2 is unresolved in total 4 cores, then the
> idx order will be '0, 1, 3' but channel order will be '5, 6, 7' without
> making any indexing gap.
> 

And you yet you claim that this is not well defined ? Or are you concerned
about the amount of memory consumed by providing an array for the mapping ?

Note that an indexing gap is acceptable and, in many cases, preferred.

[ ... ]

> >>>>>>+
> >>>>>>+    dev_dbg(dev, "%s: sensor '%s'\n", dev_name(hwmon_dev),
> >>>>>>priv->name);
> >>>>>>+
> >>>
> >>>Why does this message display the device name twice ?
> >>>
> >>
> >>For an example, dev_name(hwmon_dev) shows 'hwmon5' and priv->name shows
> >>'peci-cputemp0'.
> >>
> >And dev_dbg() shows another device name. So you'll have something like
> >
> >peci-cputemp0: hwmon5: sensor 'peci-cputemp0'
> >
> 
> Practically it shows like
> 
> peci-cputemp 0-30:00: hwmon10: sensor 'peci_cputemp.cpu0'
> 
> where 0-30:00 is assigned by peci core.
> 

And what message would you see for cpu1 ?

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
