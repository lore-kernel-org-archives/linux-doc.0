Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D245B7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Thu, 11 Jul 2019 20:50:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728596AbfGKUuk (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 11 Jul 2019 16:50:40 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:44404 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728529AbfGKUuk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 11 Jul 2019 16:50:40 -0400
Received: by mail-lj1-f193.google.com with SMTP id k18so7157571ljc.11
        for <linux-doc@vger.kernel.org>; Thu, 11 Jul 2019 13:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dYjxp66wgB3t394QorK0WPrW2jXGX2qG/znE9bxRn1o=;
        b=OH1nH1JxcyIJ1Frv7bR1psVD2AkOX68Z06jMu6w+iKf4koMKEnVt0JThRnXKzImvV7
         J3Z3Nl/H5FA/erTmCGF/qw3sMCLW0JXQR/CgOLxF+xN3iTuTAPf+3vmVJxb5wDaonHmn
         N5opQfDUhQroiwNBX3un98PdvECR62kpygl3U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dYjxp66wgB3t394QorK0WPrW2jXGX2qG/znE9bxRn1o=;
        b=KiFquuvkBjNpHMnT2DLPW4wk1BQadOCUNo7y2Sj9SDzeocjBHrpqK8vCAa9L/QeNa5
         oNnHXp7rBNSFhNvr2wMxmfwFKjmL0zEXzwth9x3rcHC4elhtVdcuXcMoR+Vv+VUTcXzX
         AhbUnD5JTcmK0Qv1vBI2kRbiJ6EOigZ2bvbESq0fudMlhLVeEkDPr7C/cMOBSG2pua6G
         I8g8Q6rKl9SEr3v3IIl4sE6zGZIXQW5uYkBhFFVpC+D18a31m2aNDgzzLnrZr0V8p8pp
         evvPxaoUTn/HhEmuwsPQBqQz/Vmoglw4yr4MLH/E76X0Up+GLq4vU3HsrHifGaujvTnN
         vwfg==
X-Gm-Message-State: APjAAAUwvYsBTE0FcomuOHvX/PVob0IIBDNvPcz1kfhkNi2uxs15jbqV
        /mk8cchd2ktleQDsZws+jqcZNY+qQtjNkzKMrOY=
X-Google-Smtp-Source: APXvYqyTowl8LDpO3glgWe4q53UddCDACSqIkn83mbNwYk66wIQHKoZZ8RculjXa8Wt7mSwwCQxgYNfcJFE9RnOFrVI=
X-Received: by 2002:a2e:9147:: with SMTP id q7mr3641900ljg.19.1562878238030;
 Thu, 11 Jul 2019 13:50:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190711204541.28940-1-joel@joelfernandes.org>
In-Reply-To: <20190711204541.28940-1-joel@joelfernandes.org>
From:   Joel Fernandes <joel@joelfernandes.org>
Date:   Thu, 11 Jul 2019 16:50:26 -0400
Message-ID: <CAEXW_YS=Sb6k4_Z-fXdtERTHZDO_PHQCOhx6bhotWduCB7K28w@mail.gmail.com>
Subject: Re: [PATCH] treewide: Rename rcu_dereference_raw_notrace to _check
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Ingo Molnar <mingo@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Josh Triplett <josh@joshtriplett.org>, kvm-ppc@vger.kernel.org,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        "Paul E. McKenney" <paulmck@linux.ibm.com>,
        Paul Mackerras <paulus@ozlabs.org>, rcu <rcu@vger.kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Byungchul Park <byungchul.park@lge.com>,
        kernel-team <kernel-team@android.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jul 11, 2019 at 4:45 PM Joel Fernandes (Google)
<joel@joelfernandes.org> wrote:
>
> The rcu_dereference_raw_notrace() API name is confusing.
> It is equivalent to rcu_dereference_raw() except that it also does
> sparse pointer checking.
>
> There are only a few users of rcu_dereference_raw_notrace(). This
> patches renames all of them to be rcu_dereference_raw_check with the
> "check" indicating sparse checking.
>
> Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>

There also these _notrace things but I am Ok with leaving them alone for now:
hash_for_each_possible_rcu_notrace
hlist_for_each_entry_rcu_notrace

- Joel
