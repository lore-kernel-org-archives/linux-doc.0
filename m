Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83AC2C433EF
	for <linux-doc@archiver.kernel.org>; Wed, 23 Feb 2022 15:41:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242274AbiBWPlt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 23 Feb 2022 10:41:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241298AbiBWPlo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 Feb 2022 10:41:44 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8964DBDE48
        for <linux-doc@vger.kernel.org>; Wed, 23 Feb 2022 07:41:12 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id gb39so53418725ejc.1
        for <linux-doc@vger.kernel.org>; Wed, 23 Feb 2022 07:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PVuQn4LRfRmIaDiVMD/Rz444D3SpL57a+e4QwSKIqQE=;
        b=Mz2xtiItA6WmqYVzO1oNIOK8wznUc0RTxV5f3XVOG3QwhOWDOewNxbX94jg5lBlTca
         rpvXIWvmRMow/22wVWicOkcILp35974hNhz+Oo28aXpiEcpfYUEKubHNGh6nggr1zSxQ
         56r7F5CwFmUfmP+I942kvDXmNfSCtI+JRRm88vtzgX5kZHG7ukbb4mck9O4fWXs0byAE
         50KFkVpbX05NmRH3Et8tcUpmKY6HY1dtHzkIzisGdzZs+DcwPzQ81OF96FmRdogWpPh6
         9HbsUSjURQqXn9XzqiLCPiKtNCLuSBcQzQShW7qPStdDRrXL4Q3eU4cZlqLLrB6Vhxst
         voXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PVuQn4LRfRmIaDiVMD/Rz444D3SpL57a+e4QwSKIqQE=;
        b=FsNwZxx2Dv9JroxSUBnlEmfni2gcbcid9WIFxMfW2OXArr/0s2rxDLK18/77G4NHEi
         dd56vcx32O8I2e3qLUFYJtqG7pFDO3bWq6gLvtkDytyiSl+JtZ7ab7ACQYAkXUF8W+10
         5M9buwb+MVlbINC+RLQY9URNFn3+tsjqZw+7fR6jBKbTL/C0nOBckCbjk49MCt1x+Vm0
         eIQlBqpxfqtiWQig0CMJwsxrKfASH8SReYF6XvzidaaGsQSv0DZVayIMU9pt0PIC/rPe
         1UtH0NJjiZN3VA3DPNuHF7xjZCgcqYg9vCizP1cu2MPPLMhpmNJOppJ9EXFzxBDQPuVr
         xQOQ==
X-Gm-Message-State: AOAM531XA32CzDO4px4uV6Cqaw+zuPSUQHZ4MCeSyBOjmfMn5lcJpfG5
        XV5H7igjH6FZl19YbpP1yBk=
X-Google-Smtp-Source: ABdhPJwU8v6XcC/FBd/vIYHa7toM1VdkpN//vPMTwzS/GJBQbYCCL9Tn2O6a4vIWdjtfv1rPBnONnA==
X-Received: by 2002:a17:906:8a98:b0:6b9:fe9:7be4 with SMTP id mu24-20020a1709068a9800b006b90fe97be4mr224120ejc.521.1645630870963;
        Wed, 23 Feb 2022 07:41:10 -0800 (PST)
Received: from fuji.fritz.box (ip-89-161-76-237.tel.tkb.net.pl. [89.161.76.237])
        by smtp.gmail.com with ESMTPSA id t24sm541ejx.187.2022.02.23.07.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 07:41:10 -0800 (PST)
Date:   Wed, 23 Feb 2022 16:41:06 +0100
From:   Tomasz =?UTF-8?B?V2FybmllxYLFgm8=?= <tomasz.warniello@gmail.com>
To:     Akira Yokosawa <akiyks@gmail.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>, corbet@lwn.net,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 00/11] Transform documentation into POD
Message-ID: <20220223164106.6a1f9a67@fuji.fritz.box>
In-Reply-To: <6a057644-7266-8c6b-76be-09b8d205e4d9@gmail.com>
References: <525f3696-91f4-5a4a-c9ef-24758ccaa2bb@infradead.org>
        <ff98f455-0221-7ff0-08ed-8dea9f08694b@gmail.com>
        <939ef119-8a84-9206-bd7c-cfd215bb0200@gmail.com>
        <20220223135548.27babd85@fuji.fritz.box>
        <1abcb226-dbfd-b3d2-5453-208af7faa0c2@gmail.com>
        <20220223150403.350ba3d0@fuji.fritz.box>
        <6a057644-7266-8c6b-76be-09b8d205e4d9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 24 Feb 2022 00:05:44 +0900
Akira Yokosawa <akiyks@gmail.com> wrote:

> I'd say _not_ introducing POD is the simplest, but I guess you have
> another thought.

Not at all. I'm in full drift.
