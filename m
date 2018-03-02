Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3CDA07E244
	for <lwn-linux-doc@archive.lwn.net>; Fri,  2 Mar 2018 14:10:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1428489AbeCBOK2 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 2 Mar 2018 09:10:28 -0500
Received: from mail-wm0-f53.google.com ([74.125.82.53]:55814 "EHLO
        mail-wm0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1425035AbeCBOKW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 2 Mar 2018 09:10:22 -0500
Received: by mail-wm0-f53.google.com with SMTP id q83so3396233wme.5
        for <linux-doc@vger.kernel.org>; Fri, 02 Mar 2018 06:10:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=9hCECDvrjRAk5o0mXq/qG/u9u+E5J/yKVsLTllGvECk=;
        b=OYzXWlwsSK4a4n0kbiNvLGYlx8Z33sp3BtsefSlBahZ3nBNW/IiiDjwwe5ds1CQBHw
         6QmR99DxdBuF8S4n05SEu8gcxO7Uy8RE0J5qVw3iXnowKmubqcp3SHpKqblJio07SiQv
         YixcV8t7DJ4LJMk3T0fHWar3xKGkGbT68YQaA8igy0aPaI6XUyj6EQmy/IMfFv6ZYS/2
         IRuTywuuTLzwn/Rxhv9TXYRkPYZTNc9ILFUZkkaDKc7bQU/RDw9B/efk4U1LTrqB51Cu
         9D6Lmn7N+4RIAeVz+6gLpVr+U8CIwCfb/r1p4fMO/TtvquP3hLSusY4ZWHwB5i4oCNpF
         igBw==
X-Gm-Message-State: AElRT7EFSwNBDZRhyYIn20UvESCjgyeyLNWfUdEpSD6QJJWY3qqyt7WM
        SvdUgTzTkvrLMY93JnWBKBQw0A==
X-Google-Smtp-Source: AG47ELsnIZ4OiCdcW657Aw7lEve0zzKk6lxBrjb7AA9zE4G2d39J8lPA6gq1hcqV2o24MdwGT4z8kw==
X-Received: by 10.28.130.9 with SMTP id e9mr1551571wmd.161.1519999821223;
        Fri, 02 Mar 2018 06:10:21 -0800 (PST)
Received: from ?IPv6:2a01:4240:2e27:ad85:aaaa::19f? (f.9.1.0.0.0.0.0.0.0.0.0.a.a.a.a.5.8.d.a.7.2.e.2.0.4.2.4.1.0.a.2.v6.cust.nbox.cz. [2a01:4240:2e27:ad85:aaaa::19f])
        by smtp.gmail.com with ESMTPSA id x10sm5941295wrc.64.2018.03.02.06.10.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 02 Mar 2018 06:10:15 -0800 (PST)
To:     Jani Nikula <jani.nikula@intel.com>
Cc:     corbet@lwn.net, linux-doc@vger.kernel.org
From:   Jiri Slaby <jslaby@suse.cz>
Subject: kernel-doc unbuildable with sphinx 1.7
Message-ID: <1b24cf1c-941b-9f0d-21e5-b595f64c49b6@suse.cz>
Date:   Fri, 2 Mar 2018 15:10:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

in openSUSE, sphinx was updated to 1.7.1 and kernel-doc cannot be built
since that time:
Running Sphinx v1.7.1

Extension error:
Could not import extension kerneldoc (exception: cannot import name
'Directive')

It is because sphinx.util.compat.* was removed from sphinx in 1.7 since
it was deprecated for a long time:
"sphinx.util.compat.%s is deprecated and will be removed "
               "in Sphinx 1.7, please use docutils' instead."


Could you fix that up? python is not my favourite interpreter so fixing
it myself is not feasible on my side.

thanks,
-- 
js
suse labs
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
