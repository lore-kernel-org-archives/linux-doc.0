Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B33507D043
	for <lwn-linux-doc@archive.lwn.net>; Mon, 21 May 2018 18:58:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751148AbeEUS6U (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 21 May 2018 14:58:20 -0400
Received: from mail-pf0-f194.google.com ([209.85.192.194]:41282 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750970AbeEUS6R (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 May 2018 14:58:17 -0400
Received: by mail-pf0-f194.google.com with SMTP id v63-v6so7516897pfk.8;
        Mon, 21 May 2018 11:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=EYrTtzdYGMe9ZECL2CgpyW5Fms1VrC+CoSj8NBKNXaQ=;
        b=J5q+4kcZdxzYXn/rtc9eXQ6OB8MlO7EqUxIcyf9wWHtcowCTvHdKTDfcTrQwsRLAlR
         vGbx2qRUBJTXk27U/n4bHWO9XJ35HRMVyb6xx8h+s9DBuNfWgMHzjcVaiwLDuz3J9bQ1
         TLMjkasngrZIeCedK7uAyMp0YPXeHVVoURK1FnSbUtfYgV2YQzM3T6JUP0oixt2VDZPS
         pjySZ7vipHHKSKqLdPGwhx7/6REODk0MMXutg7Avv1mBVj1DpZyu89LmRIhEgqv6zKTr
         4nBLgLD7BBU+YgJdf5JDxJf08OuTO8gwYiZpyQXYVNk+46B/2AAPuVpILRa7dhIi0n26
         iU5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=EYrTtzdYGMe9ZECL2CgpyW5Fms1VrC+CoSj8NBKNXaQ=;
        b=YTusvmUnLE8N0iyeeoLsT1Fdjodev4bjnP0YaXMT+OJS/Gajc5WVr7u1IFJH/jUYVC
         BxTkXg66nN2KlVXaSc/CYVdj2pPWBf2E7Gljc+aNFaM6WLpbCWJ+lYYFZuQcxPdeICma
         n8hVIuyVYOgnc9jKiXvkwRW2wmZzjbtpxLb/nYrGtUHLe9kJqrM2WC268RUaWjkaASYf
         xyYKgbpfh/HUXS02R28EJgslbJtqUL9mCrtdgfzcz875EWjhKazB3Wm7dWfJ5eclmngO
         2VwPbaE0PEePWoD31yqS8xtBUGAwQvqEMfTmyInhQt6/XuZuQoJAz1WjMAQEHp8sGbs6
         zPVw==
X-Gm-Message-State: ALKqPwfrKky5LTzXxxflJlRk2lYIJkyJTZZUkO7bIiBKCNOcqSJa/LAe
        jrhlPKH6eSKNhxS5sE8M5gs=
X-Google-Smtp-Source: AB8JxZq091whpn43rY73SFWNwDHMygFWt4RYExmRcLJn+u/2gMRSKqD4syQSCEBn6nkIUgbzet/GdQ==
X-Received: by 2002:a62:48d1:: with SMTP id q78-v6mr21328965pfi.70.1526929096215;
        Mon, 21 May 2018 11:58:16 -0700 (PDT)
Received: from ast-mbp.dhcp.thefacebook.com ([2620:10d:c090:200::5:b20b])
        by smtp.gmail.com with ESMTPSA id u5-v6sm6468693pgc.45.2018.05.21.11.58.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 May 2018 11:58:15 -0700 (PDT)
Date:   Mon, 21 May 2018 11:58:13 -0700
From:   Alexei Starovoitov <alexei.starovoitov@gmail.com>
To:     Eugene Syromiatnikov <esyr@redhat.com>
Cc:     netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, Kees Cook <keescook@chromium.org>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Alexei Starovoitov <ast@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, Jiri Olsa <jolsa@kernel.org>,
        Jesper Dangaard Brouer <brouer@redhat.com>
Subject: Re: [PATCH 0/3] bpf: add boot parameters for sysctl knobs
Message-ID: <20180521185811.2r6372timh5rfs5n@ast-mbp.dhcp.thefacebook.com>
References: <20180521122923.GA15717@asgard.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180521122923.GA15717@asgard.redhat.com>
User-Agent: NeoMutt/20180223
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, May 21, 2018 at 02:29:30PM +0200, Eugene Syromiatnikov wrote:
> Hello.
> 
> This patch set adds ability to set default values for
> kernel.unprivileged_bpf_disable, net.core.bpf_jit_harden,
> net.core.bpf_jit_kallsyms sysctl knobs as well as option to override
> them via a boot-time kernel parameter.

Commits log not only should explain 'what' is being done by the patch,
but 'why' as well.

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
