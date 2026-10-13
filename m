Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3A151477C
	for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 14:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791902437; cv=pass; b=c7whDR0c/eMJwJSx8CJkZf/RbN2zzGb13kvnvpjGKz6/ZlChYVzAu+DN1VnEHQmN61aBN6J4w5+kuUpDDRHOTkpsuPaHmstbU10g2gfYSlknELXGq+EMkIhw/planEfkQ0+18wzWIdk2Bk8EXalVFuV/K+K+w+V6m0VXzxKBkl8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791902437; c=relaxed/simple;
	bh=vIyuNaXPf/fVqFdgVoqBwfybiukFL5Xa7TqVJcyhTKQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j4Bf+ek3Gw3uADKmz+vU/m1sAX1BjY4ccQ4zlWttWePYJa3JviBLQhWqVQqCde51q2Y8ap270ugeWf9pvxrnkJTA6EwwUqC7GmhlGyc+ZScpl92Aykj4ej7J+9YObiTyDdCtn04lkQ9U87ywlsWHLJlKlGrt97qluVqLeDA1pC0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R1fhVwD+; arc=pass smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R1fhVwD+"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-91b8b456dbeso17773566d6.2
        for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 07:40:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791902435; cv=none;
        d=google.com; s=arc-20260327;
        b=gzwgNixvHAFZvFL/UavHH+8LL7wfXzIXVToREQ3Zgnj4SVi/A5GkXaH4JOR2bDrZQa
         I9dxGU8RPGvL4gcfmWJHuOT+5+VPqZ+GittaZbWecom84By4gdbaUaqb+6TTn8GinT/l
         VDAu/sVtE5/EIZ9R/N4jXvqD58dh6sqiJrRO7YPPVx2gy4uKruoYYf1QHW3/AUzG2AEc
         Ie+0YrGCDfHNcD3XGvcQRjXRG2sxyipgaHMHLdOxhkNDIjjJXPcQd8LObWHzvg15AzbZ
         aGpL4/7rFKfXHQfrqjjEOYJB6DP6ZXxY96QngVykLpL8uhiODlnsuYO4NB+rbt0CHBhm
         cACw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ur+fFzVvYF32ak9xx0wg1tr3/ez5Zf6MlIl+DWpbg80=;
        fh=bjLiHUFtxwpdENGCmnERphJPP931xbLbb9I/Gt0z2yg=;
        b=sDQ1CV324Baqoo5ZZHoClS9wN/OaN+eJa9x0X9x3xipMMiHDtOeHKeyKwpuox4CYkv
         E/OxFk6bkgE86vsoEvCNOiNufnKtJNuL1uyzL49sX2M39jZUbt/HxxVMSf9gs0LvN9if
         1i9bSN6vq8Xtlltzc3PUBTZM3bWYCQLDqsx2YCRGeiuFGPeljx6Uu8RzNWNHDKwTBj+B
         fbaSU7qocxWPuxRKanPXgRdxURKlR1Ful4gBTAEO/SGuYHILknacZ3UH3nOSP5rMPyTq
         KRdsloY4mGAT9sLCMSDRmZnsaCitplBgJcbC87oDingzeSuefgukV4iRnrcNfGOjf+2E
         2xkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791902435; x=1792507235; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ur+fFzVvYF32ak9xx0wg1tr3/ez5Zf6MlIl+DWpbg80=;
        b=R1fhVwD+nBftut0ooyBiU9QLzlQ7+UC70po/m7xipubAJ2Tn4tWJi9YL0rwcJHgQMn
         +irR2ZpX6SGFfRdxoVER4cJDg0TOS2wOp/xBbVeIQu543d9zWsUoL0+6bzQ24VdlxG/S
         HEWPKVB/LTzjTbanAtUuOgJDeWFKKpmsXXwcRm8nXeUBrE46jwhSGPISJJT51bFSiv9w
         vVZR0Er3qvczaOdPKVVU3O6P4f0EtkzZFd4IsgFAgSHiA0noIG+AACwp2TWnsHntnGgc
         bAQdI3HAUkhjtyGo19pzDTojH0mJH0yJu0zHqTDmCd7/ZR+7PK6nJ5f3M7IXFpsEeWVg
         FtVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791902435; x=1792507235;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ur+fFzVvYF32ak9xx0wg1tr3/ez5Zf6MlIl+DWpbg80=;
        b=g6WeKjUQnerRUOaAFoJPA0UVYUUHWmyVhN28mf+TCVc9r0MdSWVRCtMp6kFIPRGSmh
         GeKPt3RKUV4adGX9bV6yoo0WEic2fOiD79mdejySAqvlF+Jl8CV8H4rSBLsHsAOKy/0N
         6MfliYgNIh5WXCrcZTfvA8Hvb5xEi7V3QqE//anoTFk61sQy5DSlOZlJoCkuYLcSfNT7
         hQmnU9VWLbygO6758yB7Py2hanFU2uqmGo0n1mPPdWFYjon8wQ/8YbomItzxcMkGuLSA
         7T4nTgp1y3NmukgrK2lIAZwtj3rwK9CYQZsxAmLG3ymzZY3OmScsygGnxarKjhTHgwA6
         zH9g==
X-Forwarded-Encrypted: i=1; AKwUvBxhTgUnYRCVympJvOkxdjEZDNM0xQhM1TbOjfch9INVSaLN773I93VvEcPAlmFLkOlQ6b5FLR+Lbls=@vger.kernel.org
X-Gm-Message-State: AFq9FYLeUfzv9/hUp0j3BgCAGfmiyPorpWfDrIiDVxRQZ28hqi37iFnK
	aOiD5Hn/1MzxjF5E1vRRGjteYnmU/qoooVht2ZKBpdE0PI2OyI62PJjaaBis7t+5DQLRpLAmSDi
	6j99Mod7LJOrxXcm0tk7ODFJGTykMyFo=
X-Gm-Gg: AYBFou2ON+NdhCMqcdGcGfDdvYhAw62HJTtCPSQr97DMx80fUIsVPq7LqOR2Hd6iVSc
	M3NYdiy4M801bf83Dgf+/L3odvZK+EgZInV9xfjbT2m5G+ti2O0uxT+vTwR/C8Pn7UZym0jPEBA
	TNG9Ki88R/xTh06h2JYYvuPCUFAVQIF4D51q06neQ9cGhyfJFC2loGBjd4tJyEdG87oPGN0Wr0+
	8PWHyGJpKOXclrv3j/m4lyKN2BGrDQXpbaJrywXcFL7kznHl/MhjWQuaoliJlLehcsySukUuqBa
	4O3JFEgEiT33FvPejUepxdnTVcbIGv+op4zE8Ay/5mJA7f5IY1rBFR/e2I6kXq9PZT+hxJ7fjKE
	hpetvdB3EWeXizv69mbmeqKmsufBGY0Op78UJisOg2UlzDngrRQWWQ9ApojTcktl1I0dM
X-Received: by 2002:a05:6214:401a:b0:914:7df6:ca52 with SMTP id
 6a1803df08f44-91b555788ffmr233587636d6.9.1791902434413; Tue, 13 Oct 2026
 07:40:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013125825.3080-1-efraimvander64@gmail.com>
In-Reply-To: <20261013125825.3080-1-efraimvander64@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Tue, 13 Oct 2026 11:40:22 -0300
X-Gm-Features: AclHuK8jJ9JCEsX4JMkok-vG9E5rUqlzPeYagnBj5-Emes070Nban37h84QOnpQ
Message-ID: <CAMAsx6cNwhdZGWa87ZcXhcbKvT5bPu+_MEK11D0rfiEV1_9vkg@mail.gmail.com>
Subject: Re: [PATCH] docs: translations: pt_BR: translate cpu-load.rst
To: "Efraim E. Vander" <efraimvander64@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, "Efraim E . Vander" <fraimvander64@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 09:59, Efraim E. Vander
<efraimvander64@gmail.com> wrote:
>
> Translate cpu-load.rst into Brazilian Portuguese and
> add it to the pt_BR admin-guide documentation index.

The patch doesn't change pt_BR/admin-guide/index.rst. To be added to
the index, cpu-load should be moved from the "Todolist" to the toctree,
next to README and devices.

> Assisted-by: LLM
>
> Signed-off-by: Efraim E. Vander <efraimvander64@gmail.com>

Please keep both tags together, without a blank line between them.

> ---
>  .../pt_BR/admin-guide/cpu-load.rst            | 126 +++++++++---------
>  1 file changed, 65 insertions(+), 61 deletions(-)
>
> diff --git a/Documentation/translations/pt_BR/admin-guide/cpu-load.rst b/=
Documentation/translations/pt_BR/admin-guide/cpu-load.rst
> index 0c76acabe..f0bb48e82 100644
> --- a/Documentation/translations/pt_BR/admin-guide/cpu-load.rst
> +++ b/Documentation/translations/pt_BR/admin-guide/cpu-load.rst

This patch doesn't apply to docs-next. pt_BR/admin-guide/cpu-load.rst
doesn't exist in the tree yet, but the patch modifies it instead of
creating it. That's why it has removed lines: it seems it was generated
from a second local commit on top of a first draft, so the "-" lines
refer to text that only exists in your tree.

Please squash your commits (or generate the patch against docs-next),
so that the file is created from scratch ("new file mode",
"--- /dev/null", only "+" lines).

> +O Linux exporta diversas informa=C3=A7=C3=B5es por meio de `/proc/stat` =
e `/proc/uptime`, que ferramentas do espa=C3=A7o do usu=C3=A1rio (*userland=
*), como `top(1)`, utilizam para calcular o tempo m=C3=A9dio que o sistema =
passou em determinado estado, por exemplo::

The original uses ``/proc/stat`` and ``/proc/uptime`` (double
backquotes, rendered as literals). With single backquotes they become
interpreted text and render differently. The same applies to the other
occurrences in the file.

Also, please wrap the lines as in the original document, instead of
keeping each paragraph in a single line.

> +=C3=89 poss=C3=ADvel imaginar muitas outras situa=C3=A7=C3=B5es em que e=
sse comportamento do kernel pode gerar informa=C3=A7=C3=B5es bastante incon=
sistentes em `/proc/stat`:
>
>
> +    /* gcc -o hog smallhog.c */
> +    #include <time.h>

The original ends this sentence with "::", which starts the literal
block. With a single ":", the program below is rendered as a block
quote, not as code.

Also, please keep the example program exactly as in the original
(indented with tabs, same formatting). It is code, so it shouldn't be
changed by the translation.

Before sending a v2, please apply it with "git am" on top of docs-next
and check the result with "make htmldocs".

Thanks,
Daniel

Em ter., 13 de out. de 2026 =C3=A0s 09:59, Efraim E. Vander
<efraimvander64@gmail.com> escreveu:
>
> Translate cpu-load.rst into Brazilian Portuguese and
> add it to the pt_BR admin-guide documentation index.
>
> Assisted-by: LLM
>
> Signed-off-by: Efraim E. Vander <efraimvander64@gmail.com>
> ---
>  .../pt_BR/admin-guide/cpu-load.rst            | 126 +++++++++---------
>  1 file changed, 65 insertions(+), 61 deletions(-)
>
> diff --git a/Documentation/translations/pt_BR/admin-guide/cpu-load.rst b/=
Documentation/translations/pt_BR/admin-guide/cpu-load.rst
> index 0c76acabe..f0bb48e82 100644
> --- a/Documentation/translations/pt_BR/admin-guide/cpu-load.rst
> +++ b/Documentation/translations/pt_BR/admin-guide/cpu-load.rst
> @@ -1,27 +1,26 @@
> -
> -
>  .. SPDX-License-Identifier: GPL-2.0
>
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  Carga da CPU
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -O Linux exporta diversas informa=C3=A7=C3=B5es por meio de `/proc/stat` =
e `/proc/uptime`, que ferramentas do espa=C3=A7o do usu=C3=A1rio (*userland=
*), como `top(1)`, utilizam para calcular o tempo m=C3=A9dio que o sistema =
passou em determinado estado. Por exemplo:
> -
>
> -$ iostat
> -Linux 2.6.18.3-exp (linmac)     02/20/2007
> +O Linux exporta diversas informa=C3=A7=C3=B5es por meio de `/proc/stat` =
e `/proc/uptime`, que ferramentas do espa=C3=A7o do usu=C3=A1rio (*userland=
*), como `top(1)`, utilizam para calcular o tempo m=C3=A9dio que o sistema =
passou em determinado estado, por exemplo::
>
> -avg-cpu:  %user   %nice %system %iowait  %steal   %idle
> -           10.01    0.00    2.92    5.44    0.00   81.63
> +    $ iostat
> +    Linux 2.6.18.3-exp (linmac)     02/20/2007
>
> +    avg-cpu:  %user   %nice %system %iowait  %steal   %idle
> +               10.01    0.00    2.92    5.44    0.00   81.63
>
> -Nesse caso, o sistema considera que, durante o per=C3=ADodo de amostrage=
m padr=C3=A3o, passou 10,01% do tempo executando tarefas no espa=C3=A7o do =
usu=C3=A1rio, 2,92% no kernel e permaneceu ocioso durante 81,63% do tempo t=
otal.
> +Nesse caso, o sistema considera que, durante o per=C3=ADodo de amostrage=
m padr=C3=A3o, passou 10,01% do tempo executando tarefas no espa=C3=A7o do =
usu=C3=A1rio, 2,92% no kernel e permaneceu ocioso durante 81,63% do tempo.
>
> -Na maioria dos casos, as informa=C3=A7=C3=B5es de `/proc/stat` refletem =
a realidade com bastante precis=C3=A3o. No entanto, devido =C3=A0 natureza =
da forma como e do momento em que o kernel coleta esses dados, =C3=A0s veze=
s essas informa=C3=A7=C3=B5es n=C3=A3o s=C3=A3o confi=C3=A1veis.
> +Na maioria dos casos, as informa=C3=A7=C3=B5es de `/proc/stat` refletem =
a realidade com bastante precis=C3=A3o. No entanto, devido =C3=A0 natureza =
da forma como e do momento em que os dados s=C3=A3o coletados, esses valore=
s podem apresentar imprecis=C3=B5es.
>
>  Ent=C3=A3o, como essas informa=C3=A7=C3=B5es s=C3=A3o coletadas?
> -Sempre que uma interrup=C3=A7=C3=A3o do temporizador (*timer interrupt*)=
 =C3=A9 sinalizada, o kernel verifica que tipo de tarefa estava em execu=C3=
=A7=C3=A3o naquele instante e incrementa o contador correspondente ao tipo =
ou estado dessa tarefa.
> -O problema =C3=A9 que o sistema pode ter alternado entre v=C3=A1rios est=
ados diversas vezes entre duas interrup=C3=A7=C3=B5es do temporizador. Aind=
a assim, o contador =C3=A9 incrementado apenas para o =C3=BAltimo estado ob=
servado.
> +
> +Sempre que uma interrup=C3=A7=C3=A3o do temporizador (*timer interrupt*)=
 =C3=A9 sinalizada, o kernel verifica que tipo de tarefa estava em execu=C3=
=A7=C3=A3o naquele instante e incrementa o contador correspondente.
> +
> +O problema =C3=A9 que o sistema pode ter alternado entre v=C3=A1rios est=
ados diversas vezes entre duas interrup=C3=A7=C3=B5es do temporizador. Aind=
a assim, o contador =C3=A9 incrementado apenas uma vez, de acordo com o est=
ado observado no instante da interrup=C3=A7=C3=A3o.
>
>  Exemplo
>  -------
> @@ -35,67 +34,72 @@ Imagine um sistema com uma =C3=BAnica tarefa que, per=
iodicamente, consome ciclos de
>      |_ algo come=C3=A7a a trabalhar             |_ algo entra em suspens=
=C3=A3o
>                                                (mas =C3=A9 despertado pou=
co depois)
>
> -
> -Na situa=C3=A7=C3=A3o acima, de acordo com `/proc/stat`, a carga do sist=
ema ser=C3=A1 de 0%, pois a interrup=C3=A7=C3=A3o do temporizador sempre oc=
orrer=C3=A1 quando o sistema estiver executando o tratador de ociosidade (*=
idle handler*).
> +Na situa=C3=A7=C3=A3o acima, de acordo com `/proc/stat`, a carga do sist=
ema ser=C3=A1 de 0%, pois a interrup=C3=A7=C3=A3o do temporizador sempre oc=
orrer=C3=A1 quando o sistema estiver executando a tarefa ociosa.
>
>  Na realidade, por=C3=A9m, a carga estar=C3=A1 mais pr=C3=B3xima de 99%.
>
>  =C3=89 poss=C3=ADvel imaginar muitas outras situa=C3=A7=C3=B5es em que e=
sse comportamento do kernel pode gerar informa=C3=A7=C3=B5es bastante incon=
sistentes em `/proc/stat`:
>
>
> -        /* gcc -o hog smallhog.c */
> -
> -        #include <time.h>
> -        #include <limits.h>
> -        #include <signal.h>
> -        #include <sys/time.h>
> -        #define HIST 10
>
> -        static volatile sig_atomic_t stop;
> +    /* gcc -o hog smallhog.c */
> +    #include <time.h>
> +    #include <limits.h>
> +    #include <signal.h>
> +    #include <sys/time.h>
>
> -        static void sighandler(int signr)
> -        {
> -                (void) signr;
> -                stop =3D 1;
> -        }
> +    #define HIST 10
>
> -        static unsigned long hog (unsigned long niters)
> -        {
> -                stop =3D 0;
> -                while (!stop && --niters);
> -                return niters;
> -        }
> +    static volatile sig_atomic_t stop;
>
> -        int main (void)
> -        {
> -                int i;
> -                struct itimerval it =3D {
> -                        .it_interval =3D { .tv_sec =3D 0, .tv_usec =3D 1=
 },
> -                        .it_value    =3D { .tv_sec =3D 0, .tv_usec =3D 1=
 } };
> -                sigset_t set;
> -                unsigned long v[HIST];
> -                double tmp =3D 0.0;
> -                unsigned long n;
> -                signal(SIGALRM, &sighandler);
> -                setitimer(ITIMER_REAL, &it, NULL);
> -
> -                hog (ULONG_MAX);
> -                for (i =3D 0; i < HIST; ++i) v[i] =3D ULONG_MAX - hog(UL=
ONG_MAX);
> -                for (i =3D 0; i < HIST; ++i) tmp +=3D v[i];
> -                tmp /=3D HIST;
> -                n =3D tmp - (tmp / 3.0);
> -
> -                sigemptyset(&set);
> -                sigaddset(&set, SIGALRM);
> -
> -                for (;;) {
> -                        hog(n);
> -                        sigwait(&set, &i);
> -                }
> -                return 0;
> -        }
> +    static void sighandler(int signr)
> +    {
> +        (void) signr;
> +        stop =3D 1;
> +    }
>
> +    static unsigned long hog(unsigned long niters)
> +    {
> +        stop =3D 0;
> +        while (!stop && --niters);
> +        return niters;
> +    }
> +
> +    int main(void)
> +    {
> +        int i;
> +        struct itimerval it =3D {
> +            .it_interval =3D { .tv_sec =3D 0, .tv_usec =3D 1 },
> +            .it_value    =3D { .tv_sec =3D 0, .tv_usec =3D 1 }
> +        };
> +        sigset_t set;
> +        unsigned long v[HIST];
> +        double tmp =3D 0.0;
> +        unsigned long n;
> +
> +        signal(SIGALRM, &sighandler);
> +        setitimer(ITIMER_REAL, &it, NULL);
> +
> +        hog(ULONG_MAX);
> +        for (i =3D 0; i < HIST; ++i)
> +            v[i] =3D ULONG_MAX - hog(ULONG_MAX);
> +
> +        for (i =3D 0; i < HIST; ++i)
> +            tmp +=3D v[i];
> +
> +        tmp /=3D HIST;
> +        n =3D tmp - (tmp / 3.0);
> +
> +        sigemptyset(&set);
> +        sigaddset(&set, SIGALRM);
> +
> +        for (;;) {
> +            hog(n);
> +            sigwait(&set, &i);
> +        }
>
> +        return 0;
> +    }
>
>  Refer=C3=AAncias
>  -----------
> --
> 2.43.0
>
