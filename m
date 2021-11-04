Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BB74C433EF
	for <linux-doc@archiver.kernel.org>; Thu,  4 Nov 2021 02:53:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7C6E360C51
	for <linux-doc@archiver.kernel.org>; Thu,  4 Nov 2021 02:53:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229603AbhKDC4d (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 3 Nov 2021 22:56:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229561AbhKDC4d (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 3 Nov 2021 22:56:33 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E164C061714
        for <linux-doc@vger.kernel.org>; Wed,  3 Nov 2021 19:53:56 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id g11so4418661pfv.7
        for <linux-doc@vger.kernel.org>; Wed, 03 Nov 2021 19:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:cc:references:subject:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XAtRnVrODrp/CobqtePTGj9Xv01YTmb9pRBL9CyCbe8=;
        b=GBkOdA4jv8dS0HY9IpjS/uddq5m0iM2KEgQqigrGy4GEfy28/y7zwd8RO7BqABlhPH
         ill8RM3WkPx1PGff6PVHb5Ck7GuyW3azsJbj9llMCSUwwGdmUhqJLOJmhoQBI8LSE3Ai
         HclQnuLuXNo+DyTQX7e3uyBWoG/5BaMqoMI3UBAUTNg5iUNxDEZ0Jxt7U3oHn9LiZ9B1
         9GPa/C//RiEunLLPZ8y2PQtBRAE1cqRQNgH70LTZ0zCbrGCIUMRi/7Nf2ecxQCq95xys
         LsKwsoEry/3CE8C2U8RcY9RlFldf9jyYVg2K6V8Yuw5fssYO3NqIDkH1Ywmo8NJUQHfM
         LQXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:cc:references:subject:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XAtRnVrODrp/CobqtePTGj9Xv01YTmb9pRBL9CyCbe8=;
        b=XwNoVVvOUeZ8GCEiI21ywdRBEldUqoP6Twm7OaBOn28UXPR+V8FRX2lynHZpkEIzgc
         jLF7pIODuFUwoeCPZ9g6GwdEeKaA5e0WXciSfautLK/OuK5Mo0VaEanfwzExbP92X5Xv
         3XW8KB8lFdfpYpPiU09u4LkMITPHKI1UD8+/j1dxOrTuVYqzqudqkTUQtirRYaZUT0P+
         pbjeqegkZkWaoa/VVGuZwvlEF+Hljnw16IjzMVmrHvsWyt5UCazxKTulfyX72cz0LdID
         RktRnS4CjqSFmmmiibJY59Xe/lcHaKflghq2Jx6bTi4Fp6bmsvv70UTBNbRoMhMHBTYs
         BmMw==
X-Gm-Message-State: AOAM5313xbsWpQU8JkL9608o5GaWANQlVjK7QbYrXkZrlu3+dM0hp+iY
        ssAJWfEur9noW3kqOD/WoZaoVf1b4YQ=
X-Google-Smtp-Source: ABdhPJzwyeSaBB1IWpCRnx1Zsz49yhof6EZbHjpt+Qyf9+JrH70bDhxNTkfe/Ym1l2A1BRRNHqfo1Q==
X-Received: by 2002:a63:3f4f:: with SMTP id m76mr37055837pga.315.1635994435919;
        Wed, 03 Nov 2021 19:53:55 -0700 (PDT)
Received: from [192.168.11.5] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id e12sm2968099pgv.82.2021.11.03.19.53.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Nov 2021 19:53:55 -0700 (PDT)
To:     Deep Majumder <deep@fastmail.in>
Cc:     linux-doc@vger.kernel.org
References: <20211103172557.a557bttpaytvs6og@pop-os.localdomain>
Subject: Re: Is this is the correct list to send patches on documentation
 bugs?
From:   Akira Yokosawa <akiyks@gmail.com>
Message-ID: <bf415f8d-3584-c43e-a248-aebaab862e03@gmail.com>
Date:   Thu, 4 Nov 2021 11:53:51 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211103172557.a557bttpaytvs6og@pop-os.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello Deep,

On Wed, 3 Nov 2021 22:55:57 +0530, Deep Majumder <deep@fastmail.in> wrote:

> Hi everyone,
> I have found a bug in an area in the Linux kernel documentation (ie, the
> one available at https://www.kernel.org/doc/html/latest/).
> Is this the correct mailing list to send a patch for the same?
> Warm regards,
> Deep Majumder

Where to send a patch depends on the change itself regardless of
code or doc change.

See https://www.kernel.org/doc/html/latest/process/submitting-patches.html
, especially the section "Select the recipients for your patch".

As is mentioned there, scripts/get_maintainer.pl would be helpful.

Also see https://www.kernel.org/doc/html/latest/doc-guide/maintainer-profile.html
for contributions to documentation.

Regards,
Akira

