Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 92ED87E22F
	for <lwn-linux-doc@archive.lwn.net>; Fri,  2 Mar 2018 14:40:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1424378AbeCBOkq (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 2 Mar 2018 09:40:46 -0500
Received: from mail-wm0-f43.google.com ([74.125.82.43]:55378 "EHLO
        mail-wm0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1424355AbeCBOkp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 2 Mar 2018 09:40:45 -0500
Received: by mail-wm0-f43.google.com with SMTP id q83so3579398wme.5
        for <linux-doc@vger.kernel.org>; Fri, 02 Mar 2018 06:40:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/35wY8OHNLFuPSim+YAUFE1Z1Zj0GvaAvFlXi5xYYCk=;
        b=WP/n7+sxTTRikdM4SmFyh28/Va03x8vXgyPQuq7wEZJrAX34R8a4OY30Ny8Te9wgRv
         g/1piwNuqiXdnWInMyDh7jBHhrmW8jRx5KhQ6dm0c+g2AQFNBIKY7wXLYX8hFOAj2Dt0
         C94bQyZ0Y241hTX4rRwxOFR1a8R6NOH3Xq+cedBfk3tTNkPKPisoIYlbr4OJMs2lnTfV
         pOs9pYzDWQ6L41IckKPw52QiWnP+MEprjTljTVQ3P0eUwbrsm/EYmY/mjrdqCeBDa6xC
         UmuxvpkLrUOJwHhQRPgLHPQB+/NfkykXMFMejI6foOiboUCB5A1EbFz31Mmly1ucL1Pb
         c5ig==
X-Gm-Message-State: AElRT7GSf7V5b9i1b1U5OTu0g9lRbPw2GucI6AlyJ8jIqDnFamXw7Ult
        X4qxT7v2XBdaq1CCieHOciU=
X-Google-Smtp-Source: AG47ELuKhnuRrt8Fbaxlv3fuk75o/rd5YL5zIxXnfTupCkNgVVdwAvN++2q7Y6YMNGE+c6qR4gxDSg==
X-Received: by 10.28.8.9 with SMTP id 9mr1538685wmi.54.1520001644681;
        Fri, 02 Mar 2018 06:40:44 -0800 (PST)
Received: from ?IPv6:2a01:4240:2e27:ad85:aaaa::19f? (f.9.1.0.0.0.0.0.0.0.0.0.a.a.a.a.5.8.d.a.7.2.e.2.0.4.2.4.1.0.a.2.v6.cust.nbox.cz. [2a01:4240:2e27:ad85:aaaa::19f])
        by smtp.gmail.com with ESMTPSA id r68sm1180240wmr.14.2018.03.02.06.40.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 02 Mar 2018 06:40:43 -0800 (PST)
Subject: Re: kernel-doc unbuildable with sphinx 1.7
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Jani Nikula <jani.nikula@intel.com>, linux-doc@vger.kernel.org,
        Takashi Iwai <tiwai@suse.de>
References: <1b24cf1c-941b-9f0d-21e5-b595f64c49b6@suse.cz>
 <20180302073409.2cce15ff@lwn.net>
From:   Jiri Slaby <jslaby@suse.cz>
Message-ID: <895ece54-4bde-47d8-7c0c-adfdd21fdf23@suse.cz>
Date:   Fri, 2 Mar 2018 15:40:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180302073409.2cce15ff@lwn.net>
Content-Type: text/plain; charset=iso-8859-2
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 03/02/2018, 03:34 PM, Jonathan Corbet wrote:
> I got a patch from Takashi this very morning for that problem; I guess
> I'll have to fast-track it Linusward.

Oh, thanks!

P.S.: Takashi, could you push it to our master & stable branches?

-- 
js
suse labs
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
