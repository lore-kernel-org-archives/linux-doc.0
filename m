Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86624C0015E
	for <linux-doc@archiver.kernel.org>; Fri, 11 Aug 2023 09:05:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231127AbjHKJFp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 11 Aug 2023 05:05:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbjHKJFn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 11 Aug 2023 05:05:43 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E5F8F5
        for <linux-doc@vger.kernel.org>; Fri, 11 Aug 2023 02:05:43 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-686f38692b3so1588028b3a.2
        for <linux-doc@vger.kernel.org>; Fri, 11 Aug 2023 02:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691744743; x=1692349543;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lHSv/YVXMKpspOcEGk2QclmqStPYbocP+X+PUc9NxxQ=;
        b=G283etGUt0OE1lwUnqMxEyCvWRSgiWIMtaR/HKnbDPmjRhnPWzTTMMi9h2zJ1IXno9
         8yzSzQRynCiUZYNklGWhaX5jYvw3x75XIfTWzwzaUI1d+sYFX04BKpR8v/JdXT5i0FT1
         Xzoe4EsLkHtlYC+8Sx+I5ibFxKBnKvEN+cntn34PtbFjE8TkVE5IC4y7LjJ4o5G1Pexw
         AVgzeZtyzH1Tgr/wVeExwoxVGIq4ZfI8KkroP47isWbGsyV+ZgzI8D3sFBBqX0VefWzB
         4/5qQufBpu9vzwSsMkcdn1vb8Si1eOixu9VRkCRe3ZDn02ePViYvyB6q6XZKevY6UZnJ
         fbOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691744743; x=1692349543;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lHSv/YVXMKpspOcEGk2QclmqStPYbocP+X+PUc9NxxQ=;
        b=NiZFm6WBoD7mHkaX3SmK8O948RPGM1JOzVU4NO0RTv2tdzMoLzPn+xrUOMFebxPJLl
         8y/V6qi9bqmLlsfakhz40KYZ1ZDD966mFwTpDv2ncp7EgfP7lLoJ6/xZxqUjn6GH9Ur7
         VYlv8kCF2/lKx1LKjSPmwQ1oJ/dNHgTTwYRUf5LBVOA/fGQMG5h4d99TQuF7cDUxTwH8
         gY462KfpON+wQivsig2KpjaTJWhJ1DhOOOSFVvYwmf5Ut1GwQDibD0E9MzDkcUEKD9q0
         yyqW0OfRE/kwqB5Pam6TU+Kq8Sr7WsfdLGNNwj+aUXTswaUdt5wdV7v5EznReugdCNV2
         tI6Q==
X-Gm-Message-State: AOJu0YxmV+bDs2rqduDAv7vcVN6E81OVzw18E9mvF7LNY0clMkl+N5t1
        d9TbMKld61GoGo+pxm7Cuxrhl2VWfz3HptBSX+c2Ug==
X-Google-Smtp-Source: AGHT+IEm6DIidm5roF+w0VAhjyyDNQSZPxT+h7dFVs7QEpy+4KVgGjI2Vh6DGfPLO3+reEdVRecS1vHi1vYaSJsjyww=
X-Received: by 2002:a17:90a:fee:b0:26b:e2b:6c8d with SMTP id
 101-20020a17090a0fee00b0026b0e2b6c8dmr893454pjz.41.1691744742843; Fri, 11 Aug
 2023 02:05:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230811034600.944386-1-anshuman.khandual@arm.com> <20230811034600.944386-4-anshuman.khandual@arm.com>
In-Reply-To: <20230811034600.944386-4-anshuman.khandual@arm.com>
From:   Mike Leach <mike.leach@linaro.org>
Date:   Fri, 11 Aug 2023 10:05:31 +0100
Message-ID: <CAJ9a7Vicj85s3kbL7110Vc9UZzSG8Rk_znCjcAn9LHF8EzqD-w@mail.gmail.com>
Subject: Re: [PATCH V3 3/3] Documentation: coresight: Add cc_threshold tunable
To:     Anshuman Khandual <anshuman.khandual@arm.com>
Cc:     linux-arm-kernel@lists.infradead.org, suzuki.poulose@arm.com,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        James Clark <james.clark@arm.com>,
        Leo Yan <leo.yan@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org, coresight@lists.linaro.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 11 Aug 2023 at 04:46, Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
>
> This updates config option to include 'cc_threshold' tunable value.
>
> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
> Cc: Mike Leach <mike.leach@linaro.org>
> Cc: James Clark <james.clark@arm.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: coresight@lists.linaro.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-doc@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>  Documentation/trace/coresight/coresight.rst | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/trace/coresight/coresight.rst b/Documentation/trace/coresight/coresight.rst
> index 4a71ea6cb390..ce55adb80b82 100644
> --- a/Documentation/trace/coresight/coresight.rst
> +++ b/Documentation/trace/coresight/coresight.rst
> @@ -624,6 +624,10 @@ They are also listed in the folder /sys/bus/event_source/devices/cs_etm/format/
>     * - timestamp
>       - Session local version of the system wide setting: :ref:`ETMv4_MODE_TIMESTAMP
>         <coresight-timestamp>`
> +   * - cc_threshold
> +     - Cycle count threshold value. If nothing is provided here or the provided value is 0, then the
> +       default value i.e 0x100 will be used. If provided value is less than minimum cycles threshold
> +       value, as indicated via TRCIDR3.CCITMIN, then the minimum value will be used instead.
>
>  How to use the STM module
>  -------------------------
> --
> 2.25.1
>
Reviewed by: Mike Leach <mike.leach@linaro.org>
-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
