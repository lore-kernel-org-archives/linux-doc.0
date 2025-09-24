Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B05B18C034
	for <linux-doc@vger.kernel.org>; Wed, 24 Sep 2025 20:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758747015; cv=none; b=Ts83I6ZMAeNyS/dkWteuvmjqCox/sgjUo0bO7CuwNCJ+Zm1Jsvp3lGZ5ia61CCCYpFvZf5j9JcC+bLQuvZtcmqnbnwK7CvioKtAheydtePC5Vx7jfMz940adYR7Eb+PmD+cJFNhVp2c9imkrxbzoSMaOY60F6fQywo86dDTKa+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758747015; c=relaxed/simple;
	bh=wRramqrxc3wyAWxpl7hhmu9IRI30Tp2rzVfvYllnaq4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qVrk5fBhsrTC+nPaQmF94cikOc+bxSE6DJ6ZsS8e7kP0jkZ8tydJEu5pXfa3vAVgvlpLa5TLNaICk3SntmpPYOtpgAd33LpSGUpaF9/5UyiJwkho+3psGnT3wMUauaYXEym6NHKDQNCo+JFRLwKh9Xw9DWzsjmUrQ/5KCBSlwsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Jf6ulgRd; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Jf6ulgRd"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b5565f0488bso174396a12.2
        for <linux-doc@vger.kernel.org>; Wed, 24 Sep 2025 13:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758747013; x=1759351813; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yUtonTzH+d6Koc9tBSC0pPXzcPpJLfBt1hfJF5PLabQ=;
        b=Jf6ulgRdx4AUW96P7qeyzjryowFrLkzJSTs/9tIs2za1pVUAp3yEvtamL7+HWdlzVX
         d9l5yD7L1TcuUFctyUaGIZ52m5Qrf3/AC+Td8/qFfm3rxgWXTObNEKZ7iNdUdUGqcNku
         ic5ac+PCBoCmjFMWa7+raoSd3Xe6o7tVmoFC2fuGBv/m0i9ebgfPA0MYsdKuplR3+0i2
         NNB4VRkolviWRXHySNFDE8v878Imu9285Vdm1attzNvjroe9Q00Kd+7PLhpqB9/xLebf
         W1UoecRXrMTm/QclN6QSg8vTltgbDvuH92Fq9sRCPZcGeXi5WmxYUIQ07aS3EN7Wb+i/
         l8Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758747013; x=1759351813;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yUtonTzH+d6Koc9tBSC0pPXzcPpJLfBt1hfJF5PLabQ=;
        b=S6Cw6rrZKmDlE8IxCkw7jckW+MP+hduVUXsbNF9jHU7zaX4Edn7PRR93Zt6FqxshqP
         pzHW4Qda6iVrLAHRnoVxjbnVaR5cG9KeYrc8Sv4TxT30nIcuQRORxJ4BRMDYirQVWSud
         fPswiH2Nx+Wbiy4JnpjoJK4VuLQn49qCMuqpaX5i6xdV3uLYnAVal9PL0MQwWaFugCQc
         psZs3IqnMS3XVfAg31unfPbs56UnXhflEX0btld6bT0nrAmnpeuh09oKRTOYEXHWORmT
         9c40+TvFwfm86T3I2ivX2TZCbDq5QY0iYvcqW6b0G0CqMMV09/s0vBh3Dmolqzux7kXK
         WWDw==
X-Forwarded-Encrypted: i=1; AJvYcCUPEvXpcagalU3olMvpxMdQYA32N8JedLLIB2mrCbmmsUvIBXpd4ustjBCMiLrvwmZeN9Y5HGyLPCA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzsxex9GXKk1uLMGWscFn2g42rc7Q7f79U8+GFU43B4y6phGe8b
	BctjscwCTiGdZCw9GBYMfF/Lx73c5SNja+ogSUqm4zmFxXb6RN/0yxYv3LYPruEZHJITp1+lduA
	ZQQDYC4ki4yz6maQhRCDdvkIr1E0qmCmKN2yIBudy
X-Gm-Gg: ASbGncvx2ydsYVIC5uSAKrilIeovkeXqcKGvcKnAdyl1ywiAGLHLZCAHlTu6Bj6Hb9w
	izxNS7BVnw4v95uIILX1fEvfx70KTYTUnVcmMi7VmLjGx6uwOJ1pT0osQBRNB2tEu2J1GvHFghJ
	tQDN9qx8rJJ/wTELHkXtfKG31I2YzsixvKc734ZeWTW2Y9Gdwjd8HujSJtb+b9p54ysx4CwE+/0
	AfztNhhJK6E0bQBhrdPJrlaf1Bpg/bRAnK3TC4oxt8bcPYIoBRhXs0=
X-Google-Smtp-Source: AGHT+IE38fi+Fg0q1j7Ol0QGEtgHPSQpfsofFwHAAg/Zt4ZhCmzeJrbUHHkyUG+gDW1YXxPVgRa+tkuyDrRHf/9act4=
X-Received: by 2002:a17:903:264b:b0:269:8059:83ab with SMTP id
 d9443c01a7336-27ed4ab545emr6206725ad.51.1758747013201; Wed, 24 Sep 2025
 13:50:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250924115124.194940-1-wangjinchao600@gmail.com> <20250924115124.194940-7-wangjinchao600@gmail.com>
In-Reply-To: <20250924115124.194940-7-wangjinchao600@gmail.com>
From: Marco Elver <elver@google.com>
Date: Wed, 24 Sep 2025 22:49:35 +0200
X-Gm-Features: AS18NWBgUAm60x7jbnTDK3WCQpUXDCFu_1mbN9k4BD6qrp1olQW-5h-0n2U9Y9E
Message-ID: <CANpmjNOuA3q3BweB9kTUpAX4CX1U25Pqa0Hiyt__=7zio81=Uw@mail.gmail.com>
Subject: Re: [PATCH v5 06/23] mm/ksw: add singleton /proc/kstackwatch interface
To: Jinchao Wang <wangjinchao600@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mike Rapoport <rppt@kernel.org>, 
	Alexander Potapenko <glider@google.com>, Randy Dunlap <rdunlap@infradead.org>, 
	Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	"Liang, Kan" <kan.liang@linux.intel.com>, David Hildenbrand <david@redhat.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, Rong Xu <xur@google.com>, 
	Naveen N Rao <naveen@kernel.org>, David Kaplan <david.kaplan@amd.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Jinjie Ruan <ruanjinjie@huawei.com>, 
	Nam Cao <namcao@linutronix.de>, workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-mm@kvack.org, llvm@lists.linux.dev, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	kasan-dev@googlegroups.com, "David S. Miller" <davem@davemloft.net>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 24 Sept 2025 at 13:51, Jinchao Wang <wangjinchao600@gmail.com> wrote:
>
> Provide the /proc/kstackwatch file to read or update the configuration.
> Only a single process can open this file at a time, enforced using atomic
> config_file_busy, to prevent concurrent access.

Why is this in /proc and not debugfs?

> ksw_get_config() exposes the configuration pointer as const.
>
> Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
> ---
>  mm/kstackwatch/kernel.c      | 77 +++++++++++++++++++++++++++++++++++-
>  mm/kstackwatch/kstackwatch.h |  3 ++
>  2 files changed, 79 insertions(+), 1 deletion(-)
>
> diff --git a/mm/kstackwatch/kernel.c b/mm/kstackwatch/kernel.c
> index 3b7009033dd4..4a06ddadd9c7 100644
> --- a/mm/kstackwatch/kernel.c
> +++ b/mm/kstackwatch/kernel.c
> @@ -3,11 +3,15 @@
>
>  #include <linux/kstrtox.h>
>  #include <linux/module.h>
> +#include <linux/proc_fs.h>
> +#include <linux/seq_file.h>
>  #include <linux/string.h>
> +#include <linux/uaccess.h>
>
>  #include "kstackwatch.h"
>
>  static struct ksw_config *ksw_config;
> +static atomic_t config_file_busy = ATOMIC_INIT(0);
>
>  struct param_map {
>         const char *name;       /* long name */
> @@ -74,7 +78,7 @@ static int ksw_parse_param(struct ksw_config *config, const char *key,
>   * - sp_offset  |so (u16) : offset from stack pointer at func_offset
>   * - watch_len  |wl (u16) : watch length (1,2,4,8)
>   */
> -static int __maybe_unused ksw_parse_config(char *buf, struct ksw_config *config)
> +static int ksw_parse_config(char *buf, struct ksw_config *config)
>  {
>         char *part, *key, *val;
>         int ret;
> @@ -109,18 +113,89 @@ static int __maybe_unused ksw_parse_config(char *buf, struct ksw_config *config)
>         return 0;
>  }
>
> +static ssize_t kstackwatch_proc_write(struct file *file,
> +                                     const char __user *buffer, size_t count,
> +                                     loff_t *pos)
> +{
> +       char input[MAX_CONFIG_STR_LEN];
> +       int ret;
> +
> +       if (count == 0 || count >= sizeof(input))
> +               return -EINVAL;
> +
> +       if (copy_from_user(input, buffer, count))
> +               return -EFAULT;
> +
> +       input[count] = '\0';
> +       strim(input);
> +
> +       if (!strlen(input)) {
> +               pr_info("config cleared\n");
> +               return count;
> +       }
> +
> +       ret = ksw_parse_config(input, ksw_config);
> +       if (ret) {
> +               pr_err("Failed to parse config %d\n", ret);
> +               return ret;
> +       }
> +
> +       return count;
> +}
> +
> +static int kstackwatch_proc_show(struct seq_file *m, void *v)
> +{
> +       seq_printf(m, "%s\n", ksw_config->user_input);
> +       return 0;
> +}
> +
> +static int kstackwatch_proc_open(struct inode *inode, struct file *file)
> +{
> +       if (atomic_cmpxchg(&config_file_busy, 0, 1))
> +               return -EBUSY;
> +
> +       return single_open(file, kstackwatch_proc_show, NULL);
> +}
> +
> +static int kstackwatch_proc_release(struct inode *inode, struct file *file)
> +{
> +       atomic_set(&config_file_busy, 0);
> +       return single_release(inode, file);
> +}
> +
> +static const struct proc_ops kstackwatch_proc_ops = {
> +       .proc_open = kstackwatch_proc_open,
> +       .proc_read = seq_read,
> +       .proc_write = kstackwatch_proc_write,
> +       .proc_lseek = seq_lseek,
> +       .proc_release = kstackwatch_proc_release,
> +};
> +
> +const struct ksw_config *ksw_get_config(void)
> +{
> +       return ksw_config;
> +}
>  static int __init kstackwatch_init(void)
>  {
>         ksw_config = kzalloc(sizeof(*ksw_config), GFP_KERNEL);
>         if (!ksw_config)
>                 return -ENOMEM;
>
> +       if (!proc_create("kstackwatch", 0600, NULL, &kstackwatch_proc_ops)) {
> +               pr_err("create proc kstackwatch fail");
> +               kfree(ksw_config);
> +               return -ENOMEM;
> +       }
> +
>         pr_info("module loaded\n");
>         return 0;
>  }
>
>  static void __exit kstackwatch_exit(void)
>  {
> +       remove_proc_entry("kstackwatch", NULL);
> +       kfree(ksw_config->func_name);
> +       kfree(ksw_config->user_input);
>         kfree(ksw_config);
>
>         pr_info("module unloaded\n");
> diff --git a/mm/kstackwatch/kstackwatch.h b/mm/kstackwatch/kstackwatch.h
> index a7bad207f863..983125d5cf18 100644
> --- a/mm/kstackwatch/kstackwatch.h
> +++ b/mm/kstackwatch/kstackwatch.h
> @@ -29,4 +29,7 @@ struct ksw_config {
>         char *user_input;
>  };
>
> +// singleton, only modified in kernel.c
> +const struct ksw_config *ksw_get_config(void);
> +
>  #endif /* _KSTACKWATCH_H */
> --
> 2.43.0
>
> --
> You received this message because you are subscribed to the Google Groups "kasan-dev" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to kasan-dev+unsubscribe@googlegroups.com.
> To view this discussion visit https://groups.google.com/d/msgid/kasan-dev/20250924115124.194940-7-wangjinchao600%40gmail.com.
