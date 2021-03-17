Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 957FAC433E0
	for <linux-doc@archiver.kernel.org>; Wed, 17 Mar 2021 07:27:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4ED5364F17
	for <linux-doc@archiver.kernel.org>; Wed, 17 Mar 2021 07:27:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229675AbhCQH1Z (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 17 Mar 2021 03:27:25 -0400
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132]:48712 "EHLO
        out30-132.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229707AbhCQH1M (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 17 Mar 2021 03:27:12 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R831e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04394;MF=alex.shi@linux.alibaba.com;NM=1;PH=DS;RN=3;SR=0;TI=SMTPD_---0USESnvz_1615966029;
Received: from IT-FVFX43SYHV2H.local(mailfrom:alex.shi@linux.alibaba.com fp:SMTPD_---0USESnvz_1615966029)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 17 Mar 2021 15:27:10 +0800
Subject: Re: [PATCH v1 4/4] docs/zh_CN: Add
 zh_CN/admin-guide/security-bugs.rst
To:     Wu XiangCheng <bobwxc@email.cn>
Cc:     corbet@lwn.net, linux-doc@vger.kernel.org
References: <cover.1615950640.git.bobwxc@email.cn>
 <2552eb0fb4ddea81f80d020c69b7b7a3699dd93a.1615950640.git.bobwxc@email.cn>
From:   Alex Shi <alex.shi@linux.alibaba.com>
Message-ID: <24a5fe8f-deab-029a-4526-ef7514c31f31@linux.alibaba.com>
Date:   Wed, 17 Mar 2021 15:27:09 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.0; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <2552eb0fb4ddea81f80d020c69b7b7a3699dd93a.1615950640.git.bobwxc@email.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

LGTM.


在 2021/3/17 下午12:34, Wu XiangCheng 写道:
> Add translation zh_CN/admin-guide/security-bugs.rst, and link it to
> zh_CN/admin-guide/index.rst while clean its todo entry.
> 
> Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
> ---
>  .../translations/zh_CN/admin-guide/index.rst  |  2 +-
>  .../zh_CN/admin-guide/security-bugs.rst       | 74 +++++++++++++++++++
>  2 files changed, 75 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/admin-guide/security-bugs.rst
> 
> diff --git a/Documentation/translations/zh_CN/admin-guide/index.rst b/Documentation/translations/zh_CN/admin-guide/index.rst
> index d487e8adb804..335019901b1d 100644
> --- a/Documentation/translations/zh_CN/admin-guide/index.rst
> +++ b/Documentation/translations/zh_CN/admin-guide/index.rst
> @@ -38,11 +38,11 @@ Todolist:
>     reporting-issues
>     bug-hunting
>     bug-bisect
> +   security-bugs
>  
>  Todolist:
>  
>     reporting-bugs
> -   security-bugs
>     tainted-kernels
>     ramoops
>     dynamic-debug-howto
> diff --git a/Documentation/translations/zh_CN/admin-guide/security-bugs.rst b/Documentation/translations/zh_CN/admin-guide/security-bugs.rst
> new file mode 100644
> index 000000000000..b8120391755d
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/admin-guide/security-bugs.rst
> @@ -0,0 +1,74 @@
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: :doc:`../../../admin-guide/security-bugs`
> +
> +:译者:
> +
> + 吴想成 Wu XiangCheng <bobwxc@email.cn>
> +
> +安全缺陷
> +=========
> +
> +Linux内核开发人员非常重视安全性。因此我们想知道何时发现了安全漏洞，以便尽快
> +修复和披露。请向Linux内核安全团队报告安全漏洞。
> +
> +联络
> +-----
> +
> +可以通过电子邮件<security@kernel.org>联系Linux内核安全团队。这是一个安全人员
> +的私有列表，他们将帮助验证错误报告并开发和发布修复程序。如果您已经有了一个
> +修复，请将其包含在您的报告中，这样可以大大加快进程。安全团队可能会从区域维护
> +人员那里获得额外的帮助，以理解和修复安全漏洞。
> +
> +与任何缺陷一样，提供的信息越多，诊断和修复就越容易。如果您不清楚哪些信息有用，
> +请查看“Documentation/translations/zh_CN/admin-guide/reporting-issues.rst”中
> +概述的步骤。任何利用漏洞的攻击代码都非常有用，未经报告者同意不会对外发布，除
> +非已经公开。
> +
> +请尽可能发送无附件的纯文本电子邮件。如果所有的细节都藏在附件里，那么就很难对
> +一个复杂的问题进行上下文引用的讨论。把它想象成一个
> +:doc:`常规的补丁提交 <../process/submitting-patches>` （即使你还没有补丁）：
> +描述问题和影响，列出复现步骤，然后给出一个建议的解决方案，所有这些都是纯文本的。
> +
> +披露和限制信息
> +---------------
> +
> +安全列表不是公开渠道。为此，请参见下面的协作。
> +
> +一旦开发出了健壮的补丁，发布过程就开始了。对公开的缺陷的修复会立即发布。
> +
> +尽管我们倾向于在未公开缺陷的修复可用时即发布补丁，但应报告者或受影响方的请求，
> +这可能会被推迟到发布过程开始后的7日内，如果根据缺陷的严重性需要更多的时间，
> +则可额外延长到14天。推迟发布修复的唯一有效原因是为了适应QA的逻辑和需要发布
> +协调的大规模部署。
> +
> +虽然可能与受信任的个人共享受限信息以开发修复，但未经报告者许可，此类信息不会
> +与修复程序一起发布或发布在任何其他披露渠道上。这包括但不限于原始错误报告和
> +后续讨论（如有）、漏洞、CVE信息或报告者的身份。
> +
> +换句话说，我们唯一感兴趣的是修复缺陷。提交给安全列表的所有其他资料以及对报告
> +的任何后续讨论，即使在解除限制之后，也将永久保密。
> +
> +协调
> +------
> +
> +对敏感缺陷（例如那些可能导致权限提升的缺陷）的修复可能需要与私有邮件列表
> +<linux-distros@vs.openwall.org>进行协调，以便分发供应商做好准备，在公开披露
> +上游补丁时发布一个已修复的内核。发行版将需要一些时间来测试建议的补丁，通常
> +会要求至少几天的限制，而供应商更新发布更倾向于周二至周四。若合适，安全团队
> +可以协助这种协调，或者报告者可以从一开始就包括linux发行版。在这种情况下，请
> +记住在电子邮件主题行前面加上“[vs]”，如linux发行版wiki中所述：
> +<http://oss-security.openwall.org/wiki/mailing-lists/distros#how-to-use-the-lists>。
> +
> +CVE分配
> +--------
> +
> +安全团队通常不分配CVE，我们也不需要它们来进行报告或修复，因为这会使过程不必
> +要的复杂化，并可能耽误缺陷处理。如果报告者希望在公开披露之前分配一个CVE编号，
> +他们需要联系上述的私有linux-distros列表。当在提供补丁之前已有这样的CVE编号时，
> +如报告者愿意，最好在提交消息中提及它。
> +
> +保密协议
> +---------
> +
> +Linux内核安全团队不是一个正式的机构实体，因此无法签订任何保密协议。
> 
