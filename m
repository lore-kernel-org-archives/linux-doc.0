Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65C53C433B4
	for <linux-doc@archiver.kernel.org>; Sat,  8 May 2021 10:42:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4268C61040
	for <linux-doc@archiver.kernel.org>; Sat,  8 May 2021 10:42:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230483AbhEHKnB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 8 May 2021 06:43:01 -0400
Received: from mx2.suse.de ([195.135.220.15]:45510 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230234AbhEHKnB (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 8 May 2021 06:43:01 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 155D2B146;
        Sat,  8 May 2021 10:41:59 +0000 (UTC)
Date:   Sat, 8 May 2021 12:41:57 +0200
From:   Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Matthew Wilcox <willy@infradead.org>,
        Markus Heiser <markus.heiser@darmarit.de>,
        linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: Re: Sphinx parallel build error: UnicodeEncodeError: 'latin-1' codec
 can't encode characters in position 18-20: ordinal not in range(256)
Message-ID: <20210508104157.GC12700@kitsune.suse.cz>
References: <20210506103913.GE6564@kitsune.suse.cz>
 <30f2117f-aa38-6d60-f020-ff5cf8f004b5@darmarit.de>
 <20210506184641.6348a621@coco.lan>
 <0fd5bb54-a8fc-84b2-2bd6-31ab12f12303@darmarit.de>
 <20210506192756.2a2cc273@coco.lan>
 <cecb28f8-dfaa-3584-c9f5-fe15145ef3cf@infradead.org>
 <20210506180842.GD388843@casper.infradead.org>
 <be21de46-6655-152e-e431-144c2be6137c@infradead.org>
 <20210507083924.7b8ec1fe@coco.lan>
 <20210508112205.41946ac7@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210508112205.41946ac7@coco.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, May 08, 2021 at 11:22:05AM +0200, Mauro Carvalho Chehab wrote:
> Em Fri, 7 May 2021 08:39:24 +0200
> Mauro Carvalho Chehab <mchehab@kernel.org> escreveu:
> 
> > Em Thu, 6 May 2021 14:21:01 -0700
> > Randy Dunlap <rdunlap@infradead.org> escreveu:
> > 
> > > On 5/6/21 11:08 AM, Matthew Wilcox wrote:  
> > > > On Thu, May 06, 2021 at 10:57:53AM -0700, Randy Dunlap wrote:    
> > > >> I have been going thru some of the Documentation/ files...
> > > >>
> > > >> Why do several of the files begin with
> > > >> (hex) ef bb bf    followed by "=================="
> > > >> for a heading, instead of just "===================".
> > > >> See e.g. Documentation/timers/no_hz.rst.    
> > 
> > No idea! It seems that the text editor I used on that time added
> > it for whatever reason.
> 
> > I'll prepare a patch fixing it. Some care should be taken, however, as
> > it has two places where UTF-8 chars should be used[2].
> 
> Ok, I did a small script in order to check what special chars we
> currently have (next-20210507) at Documentation/ excluding the
> translations.
> 
> Based on my script results, we have those groups:
> 
> 1. Latin accented characters:
> 	- U+00c7 (LATIN CAPITAL LETTER C WITH CEDILLA) (Ç)
> 	- U+00df (LATIN SMALL LETTER SHARP S) (ß)
> 	- U+00e1 (LATIN SMALL LETTER A WITH ACUTE) (á)
> 	- U+00e4 (LATIN SMALL LETTER A WITH DIAERESIS) (ä)
> 	- U+00e6 (LATIN SMALL LETTER AE) (æ)
> 	- U+00e7 (LATIN SMALL LETTER C WITH CEDILLA) (ç)
> 	- U+00e9 (LATIN SMALL LETTER E WITH ACUTE) (é)
> 	- U+00ea (LATIN SMALL LETTER E WITH CIRCUMFLEX) (ê)
> 	- U+00eb (LATIN SMALL LETTER E WITH DIAERESIS) (ë)
> 	- U+00f3 (LATIN SMALL LETTER O WITH ACUTE) (ó)
> 	- U+00f4 (LATIN SMALL LETTER O WITH CIRCUMFLEX) (ô)
> 	- U+00f6 (LATIN SMALL LETTER O WITH DIAERESIS) (ö)
> 	- U+00f8 (LATIN SMALL LETTER O WITH STROKE) (ø)
> 	- U+00fc (LATIN SMALL LETTER U WITH DIAERESIS) (ü)
> 	- U+011f (LATIN SMALL LETTER G WITH BREVE) (ğ)
> 	- U+0142 (LATIN SMALL LETTER L WITH STROKE) (ł)
> 
> 2. symbols:
> 	- U+00a9 (COPYRIGHT SIGN) (©)
> 	- U+2122 (TRADE MARK SIGN) (™)
> 	- U+00ae (REGISTERED SIGN) (®)
> 	- U+00b0 (DEGREE SIGN) (°)
> 	- U+00b1 (PLUS-MINUS SIGN) (±)
> 	- U+00b2 (SUPERSCRIPT TWO) (²)
> 	- U+00b5 (MICRO SIGN) (µ)
> 	- U+00bd (VULGAR FRACTION ONE HALF) (½)
> 	- U+2026 (HORIZONTAL ELLIPSIS) (…)
> 
> 3. arrows:
> 	- U+2191 (UPWARDS ARROW) (↑)
> 	- U+2192 (RIGHTWARDS ARROW) (→)
> 	- U+2193 (DOWNWARDS ARROW) (↓)
> 	- U+2b0d (UP DOWN BLACK ARROW) (⬍)
> 
> 4. box drawings:
> 	- U+2500 (BOX DRAWINGS LIGHT HORIZONTAL) (─)
> 	- U+2502 (BOX DRAWINGS LIGHT VERTICAL) (│)
> 	- U+2514 (BOX DRAWINGS LIGHT UP AND RIGHT) (└)
> 	- U+251c (BOX DRAWINGS LIGHT VERTICAL AND RIGHT) (├)
> 
> 5. math symbols:
> 	- U+00b7 (MIDDLE DOT) (·)
> 	- U+00d7 (MULTIPLICATION SIGN) (×)
> 	- U+2212 (MINUS SIGN) (−)
> 	- U+2217 (ASTERISK OPERATOR) (∗)
> 	- U+223c (TILDE OPERATOR) (∼)
> 	- U+2264 (LESS-THAN OR EQUAL TO) (≤)
> 	- U+2265 (GREATER-THAN OR EQUAL TO) (≥)
> 	- U+27e8 (MATHEMATICAL LEFT ANGLE BRACKET) (⟨)
> 	- U+27e9 (MATHEMATICAL RIGHT ANGLE BRACKET) (⟩)
> 	- U+00ac (NOT SIGN) (¬)

Clearly his is supposed to be ASCII tilde:
Documentation/cdrom/cdrom-standard.rst: if (cdo->capability & ∼cdi->mask & CDC _⟨capability⟩)

Use of ¬ is also very dubious in documentation (in fonts it is understandable):
Documentation/ABI/obsolete/sysfs-kernel-fadump_registered:This ABI is renamed and moved to a new location /sys/kernel/fadump/registered.¬
Documentation/ABI/obsolete/sysfs-kernel-fadump_release_mem:This ABI is renamed and moved to a new location /sys/kernel/fadump/release_mem.¬
Documentation/powerpc/transactional_memory.rst:  if (MSR 29:31 ¬ = 0b010 | SRR1 29:31 ¬ = 0b000) then


The use of − is rare can could be replaed with ASCII hyphen-minus entirely
without making the text harder to understand:

Documentation/devicetree/bindings/iio/adc/adi,ad7124.yaml:          0: REFIN1(+)/REFIN1(−).
Documentation/devicetree/bindings/iio/adc/adi,ad7124.yaml:          1: REFIN2(+)/REFIN2(−).
Documentation/devicetree/bindings/iio/adc/adi,ad7192.yaml:      External reference applied between the P1/REFIN2(+) and P0/REFIN2(−) pins.
Documentation/scheduler/sched-deadline.rst:     ((M − 1) · WCET_max − WCET_min)/(M − (M − 2) · U_max) + WCET_max
drivers/gpu/drm/drm_color_mgmt.c: * - range: [-2^2, 2^2 - 2^−15]
drivers/iio/light/tsl2583.c:                     * sheet (TAOS134 − MARCH 2011):
drivers/staging/iio/adc/ad7280a.c:       *                         (Number of Conversions per Part)) −
sound/soc/codecs/sgtl5000.c: * is the array index and the following formula: 10^((idx−15)/40) * 100

Asterisk operator is clearly meant to be ASCII:
Documentation/cdrom/cdrom-standard.rst:         NULL,                   /∗ lseek ∗/
Documentation/cdrom/cdrom-standard.rst:         block _read ,           /∗ read—general block-dev read ∗/
Documentation/cdrom/cdrom-standard.rst:         block _write,           /∗ write—general block-dev write ∗/
Documentation/cdrom/cdrom-standard.rst:         NULL,                   /∗ readdir ∗/
Documentation/cdrom/cdrom-standard.rst:         NULL,                   /∗ select ∗/
Documentation/cdrom/cdrom-standard.rst:         cdrom_ioctl,            /∗ ioctl ∗/
Documentation/cdrom/cdrom-standard.rst:         NULL,                   /∗ mmap ∗/
Documentation/cdrom/cdrom-standard.rst:         cdrom_open,             /∗ open ∗/
Documentation/cdrom/cdrom-standard.rst:         cdrom_release,          /∗ release ∗/
Documentation/cdrom/cdrom-standard.rst:         NULL,                   /∗ fsync ∗/
Documentation/cdrom/cdrom-standard.rst:         NULL,                   /∗ fasync ∗/
Documentation/cdrom/cdrom-standard.rst:         NULL                    /∗ revalidate ∗/
Documentation/filesystems/ext4/blockgroup.rst:filesystem size to 2^21 ∗ 2^27 = 2^48bytes or 256TiB.

There is only one place where ⟨⟩ is used which is very dubious:
Documentation/cdrom/cdrom-standard.rst: if (cdo->capability & ∼cdi->mask & CDC _⟨capability⟩) ...

The middle dot is mostly used in mathmatical formulas that would be
unintelligible otherwise but there are a few odd uses:
Documentation/ABI/testing/sysfs-module:KernelVersion:»·3.3
Documentation/ABI/testing/sysfs-module:KernelVersion:»·3.3
Documentation/devicetree/bindings/clock/qcom,rpmcc.txt:                 "qcom,rpmcc-msm8992",·"qcom,rpmcc"
Documentation/devicetree/bindings/clock/qcom,rpmcc.txt:                 "qcom,rpmcc-msm8994",·"qcom,rpmcc"
Documentation/translations/zh_CN/kernel-hacking/hacking.rst:    阿列克谢·库兹涅佐夫享用的糟糕伏特加有关。
Documentation/translations/zh_CN/process/howto.rst:   《C程序设计语言（第2版·新版）》（徐宝文 李志 译）[机械工业出版社]
Documentation/translations/zh_CN/process/management-style.rst:.. [#cnf2] 保罗·西蒙演唱了“离开爱人的50种方法”，因为坦率地说，“告诉开发者

The × ≤ and ≥ uses look fine.

Thanks

Michal
