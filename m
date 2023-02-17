Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC360C05027
	for <linux-doc@archiver.kernel.org>; Fri, 17 Feb 2023 17:47:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229536AbjBQRrQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 17 Feb 2023 12:47:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbjBQRrP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 17 Feb 2023 12:47:15 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98F1F6FF21
        for <linux-doc@vger.kernel.org>; Fri, 17 Feb 2023 09:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676655983;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=e7NLRZnyHJz6CxIp2bsndj4MVccxx/qy4aNSV3L2uLc=;
        b=GI0WWABB+q1r+/aTxJj4uV6p9KHrIkY/D8aIsTPrduIQyf2bxzHeXiDjkl5jniF4a/OsT6
        LrskHRK89DJRuib+yz4UvogDNtJO9TMt8D07mQT/gdMwI7EIiNOesdrV1B4daKxRhPfZSM
        BJ0JKJrMQ7HqKbi+Wt90C3W+Cj/me7I=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-477-1SrslzvwPYqFyBqaFcattw-1; Fri, 17 Feb 2023 12:46:22 -0500
X-MC-Unique: 1SrslzvwPYqFyBqaFcattw-1
Received: by mail-qk1-f200.google.com with SMTP id bk26-20020a05620a1a1a00b0073b88cae2f5so539914qkb.8
        for <linux-doc@vger.kernel.org>; Fri, 17 Feb 2023 09:46:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676655982;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e7NLRZnyHJz6CxIp2bsndj4MVccxx/qy4aNSV3L2uLc=;
        b=F2Y1zpAAq8cCfaPQKfSCd3KnnJnENAlNJzkN7JZ874ir/kxN6FWxaAF2/NujFHu5Z7
         Hzseb5PDwQgGrYh3nDt0vm7jUMW+rhhc4hwXnXvQILy4cz0AqB+Nc5XVximPu4pIJ7+I
         RwR0l7xZLlmff66WTCevIsX35tJk6qTAnBWQgZDMlfg/ATRu/qguVdhaMIxWK3R3Jwih
         QhlpaNLS55akYt3cyEJTCmK8rles+4ZVL95FBixqxH7UAcag8PPwlvr29q+5IZeoDFJ+
         rvLCUfZyUke+fkgNNxg1p/znUXEi1izL8KJE/MTea0v2HuYbgJTkvTGtZoQOcuKTqtbi
         riOA==
X-Gm-Message-State: AO0yUKUO8T4hGkQ0pjxPURpVDfivw6h+nmzJb+SbxBMLUCNJagITWxVJ
        q3/UOh3xMPAvtcQ9MlT7sl5tjUwLxmNLjsloh5qOmKzDxisbzsFOxDS/M+HTt27rTHvjs7okdOC
        8O+5SgJ10NV6aQM5RpKBe
X-Received: by 2002:ac8:5c96:0:b0:3bd:1647:160b with SMTP id r22-20020ac85c96000000b003bd1647160bmr8284482qta.2.1676655982132;
        Fri, 17 Feb 2023 09:46:22 -0800 (PST)
X-Google-Smtp-Source: AK7set/NG9C0E49gn9joHJsCByX7sZR/FGcpq63wgQHLyI4kVCDz5BsMb5tm2WAqtTA4rRH5aoGV+Q==
X-Received: by 2002:ac8:5c96:0:b0:3bd:1647:160b with SMTP id r22-20020ac85c96000000b003bd1647160bmr8284438qta.2.1676655981775;
        Fri, 17 Feb 2023 09:46:21 -0800 (PST)
Received: from gerbillo.redhat.com (146-241-121-8.dyn.eolo.it. [146.241.121.8])
        by smtp.gmail.com with ESMTPSA id c13-20020ac81e8d000000b003b9ba2cf068sm3708131qtm.56.2023.02.17.09.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 09:46:21 -0800 (PST)
Message-ID: <60366cf007060025725a18a77f58c41ee7e3158b.camel@redhat.com>
Subject: Re: [PATCH v2 net-next] sfc: fix ia64 builds without CONFIG_RTC_LIB
From:   Paolo Abeni <pabeni@redhat.com>
To:     alejandro.lucero-palau@amd.com, netdev@vger.kernel.org,
        linux-net-drivers@amd.com
Cc:     davem@davemloft.net, kuba@kernel.org, edumazet@google.com,
        habetsm.xilinx@gmail.com, ecree.xilinx@gmail.com,
        linux-doc@vger.kernel.org, corbet@lwn.net, jiri@nvidia.com
Date:   Fri, 17 Feb 2023 18:46:18 +0100
In-Reply-To: <20230217170348.7402-1-alejandro.lucero-palau@amd.com>
References: <20230217170348.7402-1-alejandro.lucero-palau@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 2023-02-17 at 17:03 +0000, alejandro.lucero-palau@amd.com
wrote:
> From: Alejandro Lucero <alejandro.lucero-palau@amd.com>
>=20
> Add an embarrasingly missed semicolon breaking kernel building
> in ia64 configs.
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/oe-kbuild-all/202302170047.EjCPizu3-lkp@int=
el.com/
> Fixes: 14743ddd2495 ("sfc: add devlink info support for ef100")
> Signed-off-by: Alejandro Lucero <alejandro.lucero-palau@amd.com>
> ---
>  drivers/net/ethernet/sfc/efx_devlink.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/ethernet/sfc/efx_devlink.c b/drivers/net/etherne=
t/sfc/efx_devlink.c
> index d2eb6712ba35..3eb355fd4282 100644
> --- a/drivers/net/ethernet/sfc/efx_devlink.c
> +++ b/drivers/net/ethernet/sfc/efx_devlink.c
> @@ -323,7 +323,7 @@ static void efx_devlink_info_running_v2(struct efx_ni=
c *efx,
>  				    GET_VERSION_V2_OUT_SUCFW_BUILD_DATE);
>  		rtc_time64_to_tm(tstamp, &build_date);
>  #else
> -		memset(&build_date, 0, sizeof(build_date)
> +		memset(&build_date, 0, sizeof(build_date);

You missed the feedback on previous version from Manank reporting you
should also add a final ')' above. Should be:

+		memset(&build_date, 0, sizeof(build_date));

Please try to build test the next version before submitting it, thanks!

Paolo

