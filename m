Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07F43C433DB
	for <linux-doc@archiver.kernel.org>; Thu,  4 Mar 2021 00:30:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CEB3964E67
	for <linux-doc@archiver.kernel.org>; Thu,  4 Mar 2021 00:30:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343632AbhCDAao (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 3 Mar 2021 19:30:44 -0500
Received: from m32-153.88.com ([43.250.32.153]:8983 "EHLO email.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1383846AbhCCPfX (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 3 Mar 2021 10:35:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=K41KffRxek2IwSHEWxrNkdldzTcNsXRABdNgU
        cYwc2M=; b=khiwudigAJz0aNN2OrmqfmIYEk9vskdnEP/2Ae6mFeG2v9f796GMY
        SR7dwmpTfU9iX1+41m2kr9pfO3OD8zHXHSLOJV92gHq5U8Ee8u5FogcYOd1pgwIh
        1mc6Afgltamp+N17NFPpA61JwYCbNwS/DYGCzilX7yNsKr0nm+NH9I=
Received: from mipc (unknown [120.238.248.239])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgBn8iKFrD9g8T0UAA--.56228S2;
        Wed, 03 Mar 2021 23:34:32 +0800 (CST)
Date:   Wed, 3 Mar 2021 23:34:29 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     Alex Shi <alex.shi@linux.alibaba.com>
Cc:     harryxiyou@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 4/9] docs/zh_CN: Improve
 zh_CN/process/3.Early-stage.rst
Message-ID: <20210303153429.GA30178@mipc>
References: <cover.1614488009.git.bobwxc@email.cn>
 <0e893a3171884f832366cf248e131e9a2972762f.1614488009.git.bobwxc@email.cn>
 <f11fd22b-705b-3258-9551-e202b6c3b03b@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f11fd22b-705b-3258-9551-e202b6c3b03b@linux.alibaba.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: GiKnCgBn8iKFrD9g8T0UAA--.56228S2
X-Coremail-Antispam: 1UD129KBjvJXoWfGry8Kr45tw1kGw4rZrWDArb_yoWkZr1fpF
        ZrGa43Kw47GF90qr92k3y5Ja15C3srGayfKw1UCryxJ3s7X3yqqwnrG3W5u34fXr93ZF95
        XF4UCFy5ZFy2yFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUqab7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzx
        vE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_Cr1U
        Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7VAKI48JMxAIw2
        8IcVCjz48v1sIEY20_Cr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AK
        xVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrx
        kI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v2
        6r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8Jw
        CI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jHBTOUUUUU
        =
X-Originating-IP: [120.238.248.239]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Mar 01, 2021 at 05:13:51PM +0800, Alex Shi wrote:
> 
> 
> 在 2021/2/28 下午1:38, Wu XiangCheng 写道:
> > Improve language and grammar of zh_CN/process/3.Early-stage.rst
> > 
> > Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
> > ---
> >  .../zh_CN/process/3.Early-stage.rst           | 131 +++++++++---------
> >  1 file changed, 69 insertions(+), 62 deletions(-)
> > 
> > diff --git a/Documentation/translations/zh_CN/process/3.Early-stage.rst b/Documentation/translations/zh_CN/process/3.Early-stage.rst
> > index b8676aec6005..79e951b574fb 100644
> > --- a/Documentation/translations/zh_CN/process/3.Early-stage.rst
> > +++ b/Documentation/translations/zh_CN/process/3.Early-stage.rst
> > @@ -1,7 +1,14 @@
> >  .. include:: ../disclaimer-zh_CN.rst
> >  
> >  :Original: :ref:`Documentation/process/3.Early-stage.rst <development_early_stage>`
> > -:Translator: Alex Shi <alex.shi@linux.alibaba.com>
> > +
> > +:Translator:
> > +
> > + 时奎亮 Alex Shi <alex.shi@linux.alibaba.com>
> > +
> > +:校译:
> > +
> > + 吴想成 Wu XiangCheng <bobwxc@email.cn>
> >  
> >  .. _cn_development_early_stage:
> >  
> > @@ -9,45 +16,45 @@
> >  ========
> >  
> >  当考虑一个Linux内核开发项目时，很可能会直接跳进去开始编码。然而，与任何重要
> > -的项目一样，成功的许多基础最好是在第一行代码编写之前就做好了。在早期计划和
> > -沟通中花费一些时间可以节省更多的时间。
> > +的项目一样，许多成功的基础最好是在第一行代码编写之前就打下。在早期计划和
> > +沟通中花费一些时间可以在之后节省更多的时间。
> >  
> > -详述问题
> > +搞清问题
> >  --------
> 
> better to keep old one?
OK.
> 
> >  
> > -与任何工程项目一样，成功的内核增强从要解决的问题的清晰描述开始。在某些情况
> > -下，这个步骤很容易：例如，当某个特定硬件需要驱动程序时。不过，在其他方面，
> > -将实际问题与建议的解决方案混淆是很有诱惑力的，这可能会导致困难。
> > +与任何工程项目一样，成功的内核改善从清晰描述要解决的问题开始。在某些情况
> > +下，这个步骤很容易：例如当某个特定硬件需要驱动程序时。不过，在其他情况下，
> > +很容易将实际问题与建议的解决方案混在一起，这可能会导致麻烦。
> 
> better on Chinese custom.
> 
> >  
> > -举个例子：几年前，使用Linux音频的开发人员寻求一种方法来运行应用程序，而不因
> > -系统延迟过大而导致退出或其他工件。他们得到的解决方案是一个内核模块，旨在连
> > -接到Linux安全模块（LSM）框架中；这个模块可以配置为允许特定的应用程序访问
> > -实时调度程序。这个模块被实现并发送到Linux内核邮件列表，在那里它立即遇到问题。
> > +举个例子：几年前，Linux音频的开发人员寻求一种方法来运行应用程序，而不会因
> > +系统延迟过大而导致退出或其他问题。他们得到的解决方案是一个连接到Linux安全
> > +模块（LSM）框架中的内核模块；这个模块可以配置为允许特定的应用程序访问实时
> > +调度程序。这个模块被实现并发到linux-kernel邮件列表，在那里它立即遇到了麻烦。
> >  
> >  对于音频开发人员来说，这个安全模块足以解决他们当前的问题。但是，对于更广泛的
> >  内核社区来说，这被视为对LSM框架的滥用（LSM框架并不打算授予他们原本不具备的
> >  进程特权），并对系统稳定性造成风险。他们首选的解决方案包括短期的通过rlimit
> >  机制进行实时调度访问，以及长期的减少延迟的工作。
> >  
> > -然而，音频社区看不到他们实施的特定解决方案的过去；他们不愿意接受替代方案。
> > +然而，音频社区无法超越他们实施的特定解决方案来看问题；他们不愿意接受替代方案。
> 
> the old doc has point on the 'history', but new doc miss this point.

... could not see past the particlar solution they had ...
The 'past' means 超过[prep.], not 'history', this is a translation mistake.
> 
> >  由此产生的分歧使这些开发人员对整个内核开发过程感到失望；其中一个开发人员返回
> > -到音频列表并发布了以下内容：
> > +到audio列表并发布了以下内容：
> >  
> > -        有很多非常好的Linux内核开发人员，但他们往往会被一群傲慢的傻瓜所压倒。
> > -        试图向这些人传达用户需求是浪费时间。他们太“聪明”了，根本听不到少数人
> > -        的话。
> > +	这里有很多非常好的Linux内核开发人员，但他们往往会被一群傲慢的傻瓜所
> > +	压倒。试图向这些人传达用户需求是浪费时间。他们太“聪明”了，根本听不
> > +	到少数人的话。
> 
> Has the indent problem? and seems no need to add a word ‘这里‘。
>
Keep indent the same with the original text.
> >  
> >  （http://lwn.net/articles/131776/）
> >  
> > -实际情况不同；与特定模块相比，内核开发人员更关心系统稳定性、长期维护以及找到
> > -正确的问题解决方案。这个故事的寓意是把重点放在问题上——而不是具体的解决方案
> > -上——并在投入创建代码之前与开发社区讨论这个问题。
> > +实际情况却是不同的；与特定模块相比，内核开发人员更关心系统稳定性、长期维护
> > +以及找到问题的正确解决方案。这个故事的寓意是把重点放在问题上——而不是具体的
> > +解决方案上——并在开始编写代码之前与开发社区讨论这个问题。
> >  
> >  因此，在考虑一个内核开发项目时，我们应该得到一组简短问题的答案：
> >  
> > - - 究竟需要解决的问题是什么？
> > + - 需要解决的问题究竟是什么？
> 
> haha, actually no different.
OK.
> 
> >  
> > - - 受此问题影响的用户是谁？解决方案应该解决哪些用例？
> > + - 受此问题影响的用户有哪些？解决方案应该解决哪些使用案例？
> >  
> >   - 内核现在为何没能解决这个问题？
> 
> why remove this line?
>
Please notice that, the dash is a paragraph mark, NOT a git symbol.
There are spaces in the begin of the line.
So as follow.
> 
> >  
> > @@ -62,11 +69,11 @@
> >  
> >   - 很可能问题是由内核以您不理解的方式解决的。Linux内核很大，具有许多不明显
> >     的特性和功能。并不是所有的内核功能都像人们所希望的那样有文档记录，而且很
> > -   容易遗漏一些东西。你的作者发出了一个完整的驱动程序，复制了一个新作者不
> > -   知道的现有驱动程序。重新设计现有轮子的代码不仅浪费，而且不会被接受到主线
> > +   容易遗漏一些东西。某作者发布了一个完整的驱动程序，重复了一个其不
> > +   知道的现有驱动程序。重新发明现有轮子的代码不仅浪费，而且不会被接受到主线
> >     内核中。
> >  
> > - - 建议的解决方案中可能有一些元素不适用于主线合并。在编写代码之前，最好先
> > + - 建议的解决方案中可能有一些要素不适合并入主线。在编写代码之前，最好先
> >     了解这样的问题。
> >  
> >   - 其他开发人员完全有可能考虑过这个问题；他们可能有更好的解决方案的想法，并且
> 
> why remove this line?
> 
> > @@ -74,88 +81,88 @@
> >  
> >  在内核开发社区的多年经验给了我们一个明确的教训：闭门设计和开发的内核代码总是
> >  有一些问题，这些问题只有在代码发布到社区中时才会被发现。有时这些问题很严重，
> > -需要数月或数年的努力才能使代码达到内核社区的标准。一些例子包括：
> > +需要数月或数年的努力才能使代码达到内核社区的标准。例如：
> >  
> >   - 设计并实现了单处理器系统的DeviceScape网络栈。只有使其适合于多处理器系统，
> > -   才能将其合并到主线中。在代码中改装锁等等是一项困难的任务；因此，这段代码
> > +   才能将其合并到主线中。在代码中修改锁等等是一项困难的任务；因此，这段代码
> >     （现在称为mac80211）的合并被推迟了一年多。
> >  
> >   - Reiser4文件系统包含许多功能，核心内核开发人员认为这些功能应该在虚拟文件
> 
> why remove this line?
> 
> >     系统层中实现。它还包括一些特性，这些特性在不将系统暴露于用户引起的死锁的
> > -   情况下是不容易实现的。这些问题的最新发现——以及对其中一些问题的拒绝——已经
> > -   导致Reiser4远离了主线内核。
> > +   情况下是不容易实现的。这些问题过迟发现——以及拒绝处理其中一些问题——已经
> > +   导致Reiser4置身主线内核之外。
> >  
> >   - Apparmor安全模块以被认为不安全和不可靠的方式使用内部虚拟文件系统数据结构。
> > -   这种担心（包括其他）使Apparmor多年不在主线上。
> > +   这种担心（包括其他）使Apparmor多年来无法进入主线。
> >  
> > -在每一种情况下，通过与内核开发人员的早期讨论，可以避免大量的痛苦和额外的工作。
> > +在这些情况下，与内核开发人员的早期讨论，可以避免大量的痛苦和额外的工作。
> >  
> > -找谁交流
> > ---------
> > +找谁交流？
> > +----------
> 
> why a new "?"
>
Because the original text have one. The translation missed it.
> 
> Hmm, seem there are much of thing isn't in your explanated email.
> Would you like to just patch what's we talked? since some of trival
> changes don't has much meaning on understanding or others.
>
Sorry for the delay, I have some work recently.

I have declared that I only could point out the main changes since there are 
too many changes. This is a language improvment, not a pure code issue. My 
preface can only give general directions, not words by words. Otherwise why 
submit the patches, foreword is enough :) All in patchs, not in my notes.

I had give you more than 70 details in the foreword. If I continue do that, 
it is no different from rewriting the patches in the foreword.

I would appreciate if you could read my patches *completely* with the original 
texts.

Thanks!
Wu X.C.

