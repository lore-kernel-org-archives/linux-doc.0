Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D284F7D089
	for <lwn-linux-doc@archive.lwn.net>; Wed,  7 Nov 2018 16:19:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727576AbeKHBuL (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 7 Nov 2018 20:50:11 -0500
Received: from mx2.suse.de ([195.135.220.15]:34556 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727312AbeKHBuL (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 7 Nov 2018 20:50:11 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 34BC1AE10;
        Wed,  7 Nov 2018 16:19:07 +0000 (UTC)
Date:   Wed, 7 Nov 2018 17:19:05 +0100
From:   Michal Hocko <mhocko@kernel.org>
To:     Daniel Colascione <dancol@google.com>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>, rppt@linux.ibm.com,
        Tim Murray <timmurray@google.com>,
        Joel Fernandes <joelaf@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Roman Gushchin <guro@fb.com>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
        "Dennis Zhou (Facebook)" <dennisszhou@gmail.com>,
        Prashant Dhamdhere <pdhamdhe@redhat.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v2] Document /proc/pid PID reuse behavior
Message-ID: <20181107161905.GJ27423@dhcp22.suse.cz>
References: <20181031150625.147369-1-dancol@google.com>
 <20181105132205.138695-1-dancol@google.com>
 <20181106130524.GC2453@dhcp22.suse.cz>
 <CAKOZueu5aDtHDBzp6qKECTHEejjb=dyegQkuHh8NfwgNktzFow@mail.gmail.com>
 <20181107160015.GI27423@dhcp22.suse.cz>
 <CAKOZuevb-MED0QiL5RWJ0py=yt48=N7bPSq5bFqiwWcqN9L=Xg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKOZuevb-MED0QiL5RWJ0py=yt48=N7bPSq5bFqiwWcqN9L=Xg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed 07-11-18 16:10:01, Daniel Colascione wrote:
> On Wed, Nov 7, 2018 at 4:00 PM, Michal Hocko <mhocko@kernel.org> wrote:
[...]
> > If you really do care about pid space depletion then you
> > should use pid cgroup controller.
> 
> Or that, sure. But since cgroups are optional, the problem with the
> core model remains. In general, if there's a problem X with the core
> system API, and you can mitigate X by using a cgroup, X is still a
> problem.

I am not questioning that. All that I am saying is that there is a way to
mitigate the issue. This is not the only resource where the standard
rlimit is not sufficient and there is no other way than cgroups.
Actually cgroups were introduced to address rlimit limits IIRC.

-- 
Michal Hocko
SUSE Labs
