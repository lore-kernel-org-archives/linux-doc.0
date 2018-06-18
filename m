Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 999BE7D085
	for <lwn-linux-doc@archive.lwn.net>; Mon, 18 Jun 2018 19:32:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S936504AbeFRTcR (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 18 Jun 2018 15:32:17 -0400
Received: from mail-pl0-f49.google.com ([209.85.160.49]:36278 "EHLO
        mail-pl0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S936494AbeFRTcP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 18 Jun 2018 15:32:15 -0400
Received: by mail-pl0-f49.google.com with SMTP id a7-v6so9569574plp.3
        for <linux-doc@vger.kernel.org>; Mon, 18 Jun 2018 12:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=android.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=2zB7LTy44gbYcid4s3hV1Z4a8cFskU97j0PFZjMKnu4=;
        b=lBdPgCbrI+xQ7f44hTdEfPgcFQ9J+eb+PsP+5BTWr+Sd68Ho49FNFyMrWey4Fi81U5
         y/fuxZJwYwGCy2ZxyoJEsfuh4ajN5YYOWIqdAkEf080i3aO/XSM88AzZsqNeHLPM5L4v
         b21jGlYj5B1pcCvs+CeZlc8SQNLMAwZGkG8xzSPezwqcgfHEG8PdVFkvm1JKQo+mrj3G
         UCIuyLX3ZYEMWZM3oq5Au0STcwC7mB2UFeq4Mka+nFCfyObIucT04PS7X+0LawkcAurx
         fmSzrKMnfEkS0Cg5hSeepi+sxi+XCVuVQ1uzNSWS5kek6c3P1+u+M1C4EUnAYFN7ecWy
         QDQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=2zB7LTy44gbYcid4s3hV1Z4a8cFskU97j0PFZjMKnu4=;
        b=jGvpU8UsRdFoHjkxyoeaebrPIlisHpmm771OkwUH2yUY0ALJK+NUEeXsbLbkOaU7bT
         ql2aCJe7bXqE9hi8+AS6uHJnwW0FCK9J455Rt+a2dxWUQP+Ek2zBNLhczteRsSfr1KGa
         rCq+vqfOSIygVw+7a/g5XCkRV6d+euogB/UFdB9nXD9V1neBGgPQ+BGht5qP+RtZZZIS
         q5IWDHdEUxvhG5hRIo1y1xMRXF4Vy/YVBdJ6E+MzA4ehmAlXuc3paBzfp3eIssoJ0zTi
         73gJoULWpROhgAnpWUf1t+fQgxBoXutdd0auDPHAE8iYA+xhgUtMzWVr/7A9jzkESrdf
         R4+A==
X-Gm-Message-State: APt69E1JYYjws7kXgyAXlJ3W32JLJVVmFVMzhRvIaq+2CqZhHTEdonuB
        J9svcdQNOUu+4MWJMlyCqkGBkJsg0vI=
X-Google-Smtp-Source: ADUXVKLyFA0A8fmFh1HW6jB8XR+ofVT0rpHfOKLOzoWX91kxoSM2xvxzWuejhAqqPRQA3IpWu2UV8g==
X-Received: by 2002:a17:902:a610:: with SMTP id u16-v6mr15429748plq.195.1529350334799;
        Mon, 18 Jun 2018 12:32:14 -0700 (PDT)
Received: from nebulus.mtv.corp.google.com ([2620:0:1000:1611:6077:8eec:bc7e:d0f4])
        by smtp.googlemail.com with ESMTPSA id i4-v6sm24023667pfk.133.2018.06.18.12.32.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Jun 2018 12:32:14 -0700 (PDT)
Subject: Re: [PATCH v2] overlayfs: caller_credentials option bypass
 creator_cred
To:     linux-kernel@vger.kernel.org
Cc:     Miklos Szeredi <miklos@szeredi.hu>,
        Jonathan Corbet <corbet@lwn.net>,
        Vivek Goyal <vgoyal@redhat.com>, linux-unionfs@vger.kernel.org,
        linux-doc@vger.kernel.org
References: <20180618192726.67981-1-salyzyn@android.com>
From:   Mark Salyzyn <salyzyn@android.com>
Message-ID: <afbcabfc-2e25-d2fc-107a-5418b5e0806f@android.com>
Date:   Mon, 18 Jun 2018 12:32:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180618192726.67981-1-salyzyn@android.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 06/18/2018 12:27 PM, Mark Salyzyn wrote:
> All accesses to the lower filesystems reference the creator (mount)
> context.  This is a security issue as the user context does not
> overlay the creator context.
<sigh> been typing overlay far too many times, muscle memory struck!

"overlap the creator context."

-- Mark
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
