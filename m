Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 33AC77D04D
	for <lwn-linux-doc@archive.lwn.net>; Wed, 30 Jan 2019 18:35:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733048AbfA3Sfb (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 30 Jan 2019 13:35:31 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:36926 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733050AbfA3Sfa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 30 Jan 2019 13:35:30 -0500
Received: by mail-lj1-f196.google.com with SMTP id t18-v6so478384ljd.4
        for <linux-doc@vger.kernel.org>; Wed, 30 Jan 2019 10:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zCIG9VzWuYh+4Bf06Auxq3qGZen7OwOELA8vsXd/35o=;
        b=bzuk+pZXi21YAEqDDpBSJtx9ETbV3TvSPPgDua49V5H1nPuLiSNyTMzEwu9o6wqcBT
         2Af5cWanIGXkR2qaTuvjKsVwQa8DDgjqvGHCq1zl/tUs9v05MjF+k1Imnz+LGUQDOypo
         sXJI6OZvqz5CzhCSD/SmkcWXJQcZcH2BuZqVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zCIG9VzWuYh+4Bf06Auxq3qGZen7OwOELA8vsXd/35o=;
        b=lFjlmcvsTNOFefyxYVRGNlIoKYST2gQYCYT9phWZw8Ry3+hhQEslSbV+dAdB/PJFvm
         Gbb6EsOHnM1uQZcA92DA+Xe2N8pkH2so8IV7H0C7hFy0WqMWW9MlX5X7DxDxBF8z92hL
         1Y6LJivPk3sc7Q1iOjllMpSybGbinNawPa8kcQyLPfQbhMvZ8Xfuyw60RFLxP3QQJFXl
         ym2UNqGklpTa9iqnvpVJXvYgQ4O6XFHayhNsKYAkTjW9f8w6qUjBeRxBHAUxR+VjMEEn
         1qn3+mHTI5pNZRj8rXMTv5wVkLQ4fDUM2lDUzT1SqiyQ7rj00/CP3Kkx/UlVSCNW7eFc
         LFFg==
X-Gm-Message-State: AJcUukeV89ovIimGUjEjex4us+DIZQmLEgbtVmGlTgleiGYuQJNwPBmW
        JCFFzEA9qvm2b4eGxRwNo8dTbVekflM=
X-Google-Smtp-Source: ALg8bN6qp2ck2ZciAjPFq+u6h8pM7nQbVGN7JIH7o/I2cUbBADlOPcWMAuQEAEdAuCVONa+7OUE6fQ==
X-Received: by 2002:a2e:9a16:: with SMTP id o22-v6mr25389976lji.112.1548873326993;
        Wed, 30 Jan 2019 10:35:26 -0800 (PST)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id f1sm418424lfm.22.2019.01.30.10.35.24
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 30 Jan 2019 10:35:25 -0800 (PST)
Received: by mail-lj1-f181.google.com with SMTP id v1-v6so500374ljd.0
        for <linux-doc@vger.kernel.org>; Wed, 30 Jan 2019 10:35:24 -0800 (PST)
X-Received: by 2002:a2e:3509:: with SMTP id z9-v6mr26573226ljz.54.1548873324599;
 Wed, 30 Jan 2019 10:35:24 -0800 (PST)
MIME-Version: 1.0
References: <1544824384-17668-1-git-send-email-longman@redhat.com>
 <CAHk-=wi-V7LjAAzFuxg+eLQAdp+Ay4WmVJdTNxgPjqKXaj-3Xw@mail.gmail.com>
 <0433488a-c8ad-e31a-6144-648e45478c07@redhat.com> <260e6cdb-42b7-1891-e525-54048d168b5c@redhat.com>
In-Reply-To: <260e6cdb-42b7-1891-e525-54048d168b5c@redhat.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 30 Jan 2019 10:35:08 -0800
X-Gmail-Original-Message-ID: <CAHk-=wi1raFRkRH1HEe_awy7HVy7XWxFRv9aZY-cgNL5zMqW4A@mail.gmail.com>
Message-ID: <CAHk-=wi1raFRkRH1HEe_awy7HVy7XWxFRv9aZY-cgNL5zMqW4A@mail.gmail.com>
Subject: Re: [RESEND PATCH v4 0/3] fs/dcache: Track # of negative dentries
To:     Waiman Long <longman@redhat.com>
Cc:     Al Viro <viro@zeniv.linux.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>, linux-doc@vger.kernel.org,
        mcgrof@kernel.org, Kees Cook <keescook@chromium.org>,
        Jan Kara <jack@suse.cz>,
        Paul McKenney <paulmck@linux.vnet.ibm.com>,
        Ingo Molnar <mingo@kernel.org>,
        Miklos Szeredi <mszeredi@redhat.com>,
        Matthew Wilcox <willy@infradead.org>, lwoodman@redhat.com,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        wangkai86@huawei.com, Michal Hocko <mhocko@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jan 30, 2019 at 8:40 AM Waiman Long <longman@redhat.com> wrote:
>
> Ping. Will this patch be picked up?

Can you re-send the patch-set and I'll just apply it directly since it
seems to be languishing otherwise.

                Linus
