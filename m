Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 36FCD7D089
	for <lwn-linux-doc@archive.lwn.net>; Mon,  3 Dec 2018 14:49:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726457AbeLCOu0 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 3 Dec 2018 09:50:26 -0500
Received: from mx1.redhat.com ([209.132.183.28]:45181 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726162AbeLCOu0 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 3 Dec 2018 09:50:26 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 8A83C300239A;
        Mon,  3 Dec 2018 14:49:09 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.43.17.12])
        by smtp.corp.redhat.com (Postfix) with SMTP id B56D5605A8;
        Mon,  3 Dec 2018 14:49:07 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
        oleg@redhat.com; Mon,  3 Dec 2018 15:49:09 +0100 (CET)
Date:   Mon, 3 Dec 2018 15:49:06 +0100
From:   Oleg Nesterov <oleg@redhat.com>
To:     Roman Gushchin <guroan@gmail.com>
Cc:     Tejun Heo <tj@kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-team@fb.com,
        Roman Gushchin <guro@fb.com>
Subject: Re: [PATCH v4 4/7] cgroup: cgroup v2 freezer
Message-ID: <20181203144906.GE31795@redhat.com>
References: <20181130234745.6756-1-guro@fb.com>
 <20181130234745.6756-5-guro@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181130234745.6756-5-guro@fb.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Mon, 03 Dec 2018 14:49:09 +0000 (UTC)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 11/30, Roman Gushchin wrote:
>
> +void cgroup_enter_frozen(void)
> +{
> +	if (!current->frozen) {
> +		struct cgroup *cgrp;
> +
> +		spin_lock_irq(&css_set_lock);
> +		current->frozen = true;
> +		cgrp = task_dfl_cgroup(current);
> +		cgrp->freezer.nr_frozen_tasks++;
> +		WARN_ON_ONCE(cgrp->freezer.nr_frozen_tasks >
> +			     cgrp->freezer.nr_tasks_to_freeze);
> +		cgroup_update_frozen(cgrp, true);
> +		spin_unlock_irq(&css_set_lock);
> +	}
> +
> +	__set_current_state(TASK_INTERRUPTIBLE);
> +	schedule();
> +	__set_current_state(TASK_RUNNING);

forgot to mention, schedule() always returns in TASK_RUNNING, so the 2nd
__set_current_state() is pointless.

Oleg.

