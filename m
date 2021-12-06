Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C55FC433F5
	for <linux-doc@archiver.kernel.org>; Mon,  6 Dec 2021 15:34:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357519AbhLFPiJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 6 Dec 2021 10:38:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1388235AbhLFPc3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 6 Dec 2021 10:32:29 -0500
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 453DCC09B06D
        for <linux-doc@vger.kernel.org>; Mon,  6 Dec 2021 07:19:31 -0800 (PST)
Received: by mail-qt1-x82d.google.com with SMTP id p19so11046946qtw.12
        for <linux-doc@vger.kernel.org>; Mon, 06 Dec 2021 07:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nefXY9GnrKTvs8NuB1vTMpAOilGrkfP6qgHIvnqCGyA=;
        b=HzYh2WxY8Q+EgOkB2smBNZ25CT3P5TCbZA91IuxwSLyZw7X7AbSYLmJEljM3LlDwFx
         lY8VvbF9xOM4Psmx2Kh9WX8lRdwFEMYfS6mr3MXhAhkjeVWwSXTdCzxNGP0M8Eqaa7dN
         D+lH/ekiFAwEukjTTKRP3Q43Qqa54gnyAeHmk61hhdv8zarhymwU5U6GvAoB4ZZ+K3ZH
         bQKCen1R+8SJvC0WKy2eNUOCPB9kXlRoY1KVCNh7vY0q+agMYnkTfCD5Ao7FANJOiaWD
         HzvM+F48qhwpHiZkY/rH7viLoFAKAMa+9dHA6Pkfvuzu/pW7n45fUfXm6CSS0BFdRnbs
         B7NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nefXY9GnrKTvs8NuB1vTMpAOilGrkfP6qgHIvnqCGyA=;
        b=Dp4xuSpzh54eUsoG5D06aBlNYfLtllw5lHOoJLV0xkqZeNML3SxwJ2THfT1Pe2BgS0
         8zHKk3or84Q1+VIj8XzBxWu6Tv6FljKDPaLEhQURR+lzWTd8TP4TpgxCKjMA4vjmnwW8
         1YnB3Wb/1fj0VHdkBHh/StI4DzwHTZql/lQ1qjCmmwORFWOArWUBvqpr0C10hYtZWQRG
         swDvG4cNdyYURUxJSTMoC0QQQveQ+aOvRVsOcpZbVbAkk5k8IvH98RHXb2/270Kfat9d
         k5/eUsfrqJ8E4JgUzGRgKj1aFCvvcRi9ZiONQcrLfQ0fWs5YKKIcjCZtlAvVUupgNok+
         CNbQ==
X-Gm-Message-State: AOAM533Rbn4O3FOMwav3DNVFt8qcYMmOpQ3WQf6+lFegMr4qvh08C+Nk
        +kk0EAQcBf1WuucH85yaQaGDfw==
X-Google-Smtp-Source: ABdhPJxSYyh4j4Ckh7jks6r8W3wi3f74t9J4HYT3qkHXAcm2NbLDr0ElmK/TnADyXfHBrmWGl7cp9w==
X-Received: by 2002:ac8:7d84:: with SMTP id c4mr40411114qtd.94.1638803970478;
        Mon, 06 Dec 2021 07:19:30 -0800 (PST)
Received: from localhost (cpe-98-15-154-102.hvc.res.rr.com. [98.15.154.102])
        by smtp.gmail.com with ESMTPSA id b6sm7721017qtk.91.2021.12.06.07.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 07:19:29 -0800 (PST)
Date:   Mon, 6 Dec 2021 10:19:29 -0500
From:   Johannes Weiner <hannes@cmpxchg.org>
To:     Dan Schatzberg <schatzberg.dan@gmail.com>
Cc:     Roman Gushchin <guro@fb.com>, Tejun Heo <tj@kernel.org>,
        Zefan Li <lizefan.x@bytedance.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Hocko <mhocko@kernel.org>,
        Vladimir Davydov <vdavydov.dev@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Shakeel Butt <shakeelb@google.com>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Muchun Song <songmuchun@bytedance.com>,
        Alex Shi <alexs@kernel.org>,
        Wei Yang <richard.weiyang@gmail.com>,
        "open list:CONTROL GROUP (CGROUP)" <cgroups@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" 
        <linux-mm@kvack.org>
Subject: Re: [PATCH] mm: add group_oom_kill memory event
Message-ID: <Ya4qAWzz6Ozq07Sl@cmpxchg.org>
References: <20211203162426.3375036-1-schatzberg.dan@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211203162426.3375036-1-schatzberg.dan@gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This makes perfect sense, just one minor point:

On Fri, Dec 03, 2021 at 08:24:23AM -0800, Dan Schatzberg wrote:
> @@ -4390,6 +4390,9 @@ static int mem_cgroup_oom_control_read(struct seq_file *sf, void *v)
>  	seq_printf(sf, "under_oom %d\n", (bool)memcg->under_oom);
>  	seq_printf(sf, "oom_kill %lu\n",
>  		   atomic_long_read(&memcg->memory_events[MEMCG_OOM_KILL]));
> +	seq_printf(sf, "oom_group_kill %lu\n",
> +		   atomic_long_read(
> +			&memcg->memory_events[MEMCG_OOM_GROUP_KILL]));
>  	return 0;
>  }

oom_control is a cgroup1 file, but group-oom is a cgroup2-only
feature. Best to drop this hunk.

With that, please add:
Acked-by: Johannes Weiner <hannes@cmpxchg.org>
